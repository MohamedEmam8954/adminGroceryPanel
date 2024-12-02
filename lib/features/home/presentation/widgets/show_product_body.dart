import 'package:admingrocerypanel/core/widgets/responsive.dart';
import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:admingrocerypanel/features/home/data/model/product_model.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/edit_product_data.dart';
import 'package:flutter/material.dart';

class ShowProductViewBody extends StatelessWidget {
  const ShowProductViewBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Responsive.isDeskTop(context)) const SideMenu(),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: EditProductData(
            productModel: productModel,
          ),
        ),
      ],
    );
  }
}
