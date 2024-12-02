import 'dart:developer';

import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/utils/global_method.dart';
import 'package:admingrocerypanel/core/widgets/customtextformfield.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_cubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_state.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/categorydropmenu.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/categoryradiobtn.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/custombuttons.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/customdottedborder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class UploadProductForm extends StatefulWidget {
  const UploadProductForm({super.key});

  @override
  State<UploadProductForm> createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {
  var globalkey = GlobalKey<FormState>();

  String productCategory = "Vegetables";
  int ispiece = 0;
  TextEditingController producteditingcontroller = TextEditingController();
  TextEditingController priceeditingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var dataCubit = context.read<Datacubit>();
    var imagePickerCubit = context.read<ImagePickerCubit>();
    return Form(
      key: globalkey,
      child: BlocConsumer<ImagePickerCubit, ImagePickerState>(
        listener: (context, state) {
          if (state is ImagePickerSucess) {
            log("state.imageUrl");
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.productTitle,
                style: AppStyles.style15,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextFormField(
                    controller: producteditingcontroller,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return AppStrings.requiredproduct;
                      }
                      return null;
                    },
                    fill: true,
                    filledcolor: Colors.white,
                    maxlines: 1,
                    textInputType: TextInputType.text),
              ),
              Text(
                AppStrings.price,
                style: AppStyles.style15,
              ),
              Row(children: [
                SizedBox(
                  width: 155,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextFormField(
                              controller: priceeditingcontroller,
                              inputFormatter: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9.]')),
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  if (newValue.text.contains('.') &&
                                      newValue.text.indexOf('.') !=
                                          newValue.text.lastIndexOf('.')) {
                                    return oldValue; // Reject the change
                                  }
                                  return newValue; // Accept the change
                                }),
                              ],
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return AppStrings.requiredprice;
                                }
                                return null;
                              },
                              fill: true,
                              filledcolor: Colors.white,
                              maxlines: 1,
                              textInputType: TextInputType.text),
                        ),
                      ),
                      Text(
                        AppStrings.productCategory,
                        style: AppStyles.style15,
                      ),
                      const SizedBox(height: 10),
                      //! drop down menu
                      Container(
                        height: 45,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: CategoryDropMenu(
                            onchanged: (value) {
                              productCategory = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppStrings.measureUnit,
                        style: AppStyles.style15,
                      ),
                      //! choose one Category
                      CatgoryRadioBtn(
                        ispiece: 0,
                        onchanged: (value) {
                          ispiece = value;
                        },
                      ),
                    ],
                  ),
                ),
                imagePickerCubit.selectedImage != null
                    ? kIsWeb
                        ? SizedBox(
                            width: size.width > 650 ? 300 : size.width * 0.45,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.memory(
                                imagePickerCubit.webImage!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : SizedBox(
                            width: size.width > 650 ? 300 : size.width * 0.45,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                imagePickerCubit.selectedImage!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                    : CustomDottedBorder(
                        onTapChooseImg: () =>
                            imagePickerCubit.pickAndUploadImage(),
                      ),
                imagePickerCubit.selectedImage != null
                    ? Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              imagePickerCubit.selectedImage = null;
                              imagePickerCubit.webImage = Uint8List(8);
                              setState(() {}); // Trigger UI update
                            },
                            child: Text(
                              "Clear Image",
                              style:
                                  AppStyles.style14.copyWith(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              imagePickerCubit.pickAndUploadImage();
                            },
                            child: Text(
                              "Update Image",
                              style: AppStyles.style14,
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ]),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBtn(
                      text: AppStrings.clearForm,
                      backgroundcolor: Colors.red,
                      onpressed: () {
                        // Clear all form fields
                        producteditingcontroller.clear();
                        priceeditingcontroller.clear();
                        imagePickerCubit.selectedImage = null;
                        imagePickerCubit.webImage = Uint8List(8);
                        setState(() {
                          ispiece = 0;
                        });
                      },
                      icon: IconlyLight.danger),
                  const SizedBox(width: 30),
                  CustomBtn(
                      text: AppStrings.upload,
                      backgroundcolor: Colors.blue,
                      onpressed: () {
                        if (imagePickerCubit.selectedImage == null) {
                          GlobalMethod.errorDialog(
                            context,
                            subTitle: "please select an image",
                          );
                        } else if (globalkey.currentState!.validate()) {
                          dataCubit.sendData(
                            imgUrl: state is ImagePickerSucess
                                ? state.imageUrl
                                : "",
                            productTitle: producteditingcontroller.text,
                            price: priceeditingcontroller.text,
                            productCategory: productCategory,
                            ispiece: ispiece,
                          );
                        }
                      },
                      icon: IconlyLight.upload),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
