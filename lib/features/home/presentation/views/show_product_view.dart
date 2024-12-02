import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:admingrocerypanel/features/home/data/model/product_model.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/show_product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowProductView extends StatelessWidget {
  const ShowProductView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    var menucubit = context.read<MenuCubit>();
    return Scaffold(
      key: menucubit.showproductdata,
      drawer: const SideMenu(),
      body: ShowProductViewBody(
        productModel: productModel,
      ),
    );
  }
}
