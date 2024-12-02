import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/widgets/loading_manager.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_cubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_state.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({super.key, required this.onTapChooseImg});
  final VoidCallback onTapChooseImg;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ImagePickerCubit, ImagePickerState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LoadingManager(
            isloading: state is ImagePickerloading ? true : false,
            child: Container(
              width: size.width > 650 ? 300 : size.width * 0.45,
              height: 180,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: DottedBorder(
                color: Colors.white,
                dashPattern: const [6.7],
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image_outlined,
                        size: 50,
                      ),
                      TextButton(
                        onPressed: onTapChooseImg,
                        child: const Text(AppStrings.chooseImage),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
