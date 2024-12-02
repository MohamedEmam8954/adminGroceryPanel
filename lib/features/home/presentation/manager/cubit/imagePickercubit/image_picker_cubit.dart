import 'dart:developer';
import 'dart:io';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_state.dart';
import 'package:admingrocerypanel/features/home/services/firebase_services.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(InitialImagePickerState());

  File? selectedImage;
  Uint8List? webImage;
  String imageUrl = "";

  // Your Cloudinary folder name
  final String cloudinaryCustomFolder = 'Product';

  Future<void> pickAndUploadImage() async {
    emit(ImagePickerloading()); // Emit loading state

    try {
      final imagePicker = ImagePicker();
      XFile? image;

      if (kIsWeb) {
        image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          webImage = await image.readAsBytes();
          selectedImage = File('a'); // No need for File in web context
        }
      } else {
        image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          selectedImage = File(image.path);
          webImage = null;
        }
      }

      if (image != null) {
        // Upload image to Cloudinary
        imageUrl = await _uploadImageToCloudinary(image);
        if (imageUrl.isNotEmpty) {
          emit(ImagePickerSucess(imageUrl: imageUrl)); // Emit success with URL
        } else {
          emit(ImagePickerFailure(errorMessage: 'Failed to upload image.'));
        }
      } else {
        emit(ImagePickerFailure(errorMessage: 'No image selected.'));
      }
    } catch (e) {
      emit(ImagePickerFailure(errorMessage: e.toString()));
    }
  }

  _uploadImageToCloudinary(XFile image) async {
    try {
      final cloudinary = FirebaseServices.cloudinary();

      // If uploading as bytes (for web)
      Uint8List? bytesToUpload;
      if (kIsWeb && webImage != null) {
        bytesToUpload = webImage;
      } else if (!kIsWeb && selectedImage != null) {
        bytesToUpload = selectedImage!.readAsBytesSync(); // For mobile devices
      }

      if (bytesToUpload != null) {
        String imageFile =
            "image ${DateTime.now().millisecondsSinceEpoch}_${image.name}";
        final response = await cloudinary.upload(
          fileBytes: bytesToUpload,
          resourceType: CloudinaryResourceType.image,
          folder: cloudinaryCustomFolder,
          fileName: imageFile, // Use a dynamic name here if needed
          progressCallback: (count, total) {
            log('Uploading image with progress: $count/$total');
          },
        );

        if (response.isSuccessful) {
          // Successfully uploaded, get the secure URL
          log('Image uploaded successfully. URL: ${response.secureUrl}');
          return response.secureUrl; // Return the secure URL
        } else {
          log('Cloudinary upload failed: ${response.error}');
          return ''; // Return empty if the upload fails
        }
      }
      return ''; // Return empty if no valid bytes to upload
    } catch (e) {
      log('Error uploading to Cloudinary: ${e.toString()}');
      return ''; // Return empty if there's an error
    }
  }
}
