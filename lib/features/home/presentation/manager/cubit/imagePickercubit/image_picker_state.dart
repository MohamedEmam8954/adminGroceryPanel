class ImagePickerState {}

class InitialImagePickerState extends ImagePickerState {}

class ImagePickerloading extends ImagePickerState {}

class ImagePickerSucess extends ImagePickerState {
  final String imageUrl;

  ImagePickerSucess({required this.imageUrl});
}

class ImagePickerFailure extends ImagePickerState {
  final String errorMessage;

  ImagePickerFailure({required this.errorMessage});
}
