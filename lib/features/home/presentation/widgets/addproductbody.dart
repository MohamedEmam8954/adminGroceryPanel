import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/widgets/headerwidget.dart';
import 'package:admingrocerypanel/core/widgets/loading_manager.dart';
import 'package:admingrocerypanel/core/widgets/responsive.dart';
import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/data_cubit_state.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_cubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/upload_product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDeskTop(context)) const SideMenu(),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: ScrollController(),
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  HeaderWidget(
                      showTextField: false,
                      title: AppStrings.addProduct,
                      ontap: () {
                        context.read<MenuCubit>().controlAddProductMenu();
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocProvider(
                    create: (context) => ImagePickerCubit(),
                    child: BlocConsumer<Datacubit, DataCubitState>(
                      listener: (context, state) {
                        if (state is DataCubitStateAddedSucessfully) {
                          Fluttertoast.showToast(
                              msg: AppStrings.yourProductIsUploaded,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          BlocProvider.of<ImagePickerCubit>(context).imageUrl =
                              "";
                        }
                      },
                      builder: (context, state) {
                        return LoadingManager(
                          isloading:
                              state is LoadingDataCubitState ? true : false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            width: size.width > 650 ? 700 : size.width,
                            color: Theme.of(context).cardColor,
                            child: const UploadProductForm(),
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
