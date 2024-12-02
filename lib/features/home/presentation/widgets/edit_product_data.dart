import 'dart:developer';

import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/dependency_injection.dart';
import 'package:admingrocerypanel/core/widgets/headerwidget.dart';
import 'package:admingrocerypanel/core/widgets/loading_manager.dart';
import 'package:admingrocerypanel/features/home/data/model/product_model.dart';
import 'package:admingrocerypanel/features/home/data/repo/repo/homerepoimp.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/data_cubit_state.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_cubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/edit_product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProductData extends StatelessWidget {
  const EditProductData({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        HeaderWidget(
          showTextField: false,
          ontap: () {
            context.read<MenuCubit>().controlShowProduct();
          },
          title: AppStrings.editProduct,
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: ScrollController(),
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BlocProvider(
                    create: (context) => ImagePickerCubit(),
                    child: BlocConsumer<Datacubit, DataCubitState>(
                      listener: (context, state) {
                        if (state is UpdateProductSucessfully) {
                          Fluttertoast.showToast(
                              msg: AppStrings.yourProductIsUploaded,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        if (state is UpdateProductStateFailure) {
                          Fluttertoast.showToast(
                              msg: state.errorMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);

                          log(state.errorMessage);
                        }
                      },
                      builder: (context, state) {
                        return LoadingManager(
                          isloading:
                              state is LoadingUpdateProductState ? true : false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            width: size.width > 650 ? 700 : size.width,
                            color: Theme.of(context).cardColor,
                            child: EditProductForm(
                              productModel: productModel,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
