import 'dart:developer';
import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/utils/global_method.dart';
import 'package:admingrocerypanel/core/widgets/customtextformfield.dart';
import 'package:admingrocerypanel/core/widgets/loading_manager.dart';
import 'package:admingrocerypanel/features/home/data/model/product_model.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/data_cubit_state.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_cubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/imagePickercubit/image_picker_state.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/categorydropmenu.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/categoryradiobtn.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/custombuttons.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/onsale_percent_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class EditProductForm extends StatefulWidget {
  const EditProductForm({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  var globalkey = GlobalKey<FormState>();

  String productCategory = "Vegtables";
  int ispiece = 0;
  bool isonSale = false;
  TextEditingController producteditingcontroller = TextEditingController();
  TextEditingController priceeditingcontroller = TextEditingController();
  String showpercentValue = "0";
  String percentValue = "0";
  late double price;
  late double priceAfterSale;
  String percent = '0';

  @override
  void initState() {
    productCategory = widget.productModel.productCategory;
    ispiece = widget.productModel.piece;
    producteditingcontroller.text = widget.productModel.title;
    priceeditingcontroller.text = widget.productModel.price;
    priceAfterSale = double.parse(widget.productModel.price);
    price = double.parse(widget.productModel.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var dataCubit = context.read<Datacubit>();
    var imagePickerCubit = context.read<ImagePickerCubit>();
    return Form(
      key: globalkey,
      child: BlocConsumer<ImagePickerCubit, ImagePickerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Row(
                children: [
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
                                oncChanged: (value) {
                                  if (value.isEmpty) return;
                                  price = double.parse(value);
                                  log(price.toString());
                                  setState(() {});
                                },
                                controller: priceeditingcontroller,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return AppStrings.requiredprice;
                                  }
                                  return null;
                                },
                                fill: true,
                                filledcolor: Colors.white,
                                maxlines: 3,
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
                          ispiece: widget.productModel.piece,
                          onchanged: (value) {
                            ispiece = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<ImagePickerCubit, ImagePickerState>(
                    builder: (context, state) {
                      return LoadingManager(
                        isloading: state is ImagePickerloading ? true : false,
                        child: SizedBox(
                          width: size.width > 650 ? 300 : size.width * 0.45,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: imagePickerCubit.webImage == null
                                ? CachedNetworkImage(
                                    imageUrl: widget.productModel.imgUrl)
                                : Image.memory(imagePickerCubit.webImage!),
                          ),
                        ),
                      );
                    },
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
              ),
              const SizedBox(height: 10),
              // !
              OnSaleParcent(
                getpriceAfterSale: widget.productModel.onsale,
                getPercent: widget.productModel.percent,
                onPercentChanged: (value) {
                  percent = value;
                },
                isonsale: widget.productModel.isOnSale,
                price: price,
                onchanged: (value) {
                  priceAfterSale = value;
                  if (price != priceAfterSale) {
                    isonSale = true;
                  } else {
                    isonSale = false;
                  }
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocListener<Datacubit, DataCubitState>(
                    listener: (context, state) {
                      if (state is DeleteSucessState) {
                        GoRouter.of(context).pop();
                      }
                    },
                    child: CustomBtn(
                        text: AppStrings.delete,
                        backgroundcolor: Colors.red,
                        onpressed: () {
                          GlobalMethod.warningDialog(context,
                              title: AppStrings.delete,
                              subTitle: AppStrings.pressOK, ontap: () {
                            dataCubit.deleteproduct(id: widget.productModel.id);
                          });
                        },
                        icon: IconlyLight.danger),
                  ),
                  const SizedBox(width: 30),
                  CustomBtn(
                      text: AppStrings.update,
                      backgroundcolor: Colors.blue,
                      onpressed: () {
                        if (globalkey.currentState!.validate()) {
                          // ! update product here
                          dataCubit.updateData(
                            percent: percent,
                            isOnSale: isonSale,
                            priceAfterSale: priceAfterSale,
                            id: widget.productModel.id,
                            imgUrl: state is ImagePickerSucess
                                ? state.imageUrl
                                : widget.productModel.imgUrl,
                            productTitle: producteditingcontroller.text,
                            price: priceeditingcontroller.text,
                            productCategory: productCategory,
                            ispiece: ispiece,
                          );
                        }
                      },
                      icon: IconlyLight.setting),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
