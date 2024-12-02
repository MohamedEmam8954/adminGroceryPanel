import 'package:admingrocerypanel/core/utils/app_router.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/utils/dependency_injection.dart';
import 'package:admingrocerypanel/features/home/data/model/product_model.dart';
import 'package:admingrocerypanel/features/home/data/repo/repo/homerepoimp.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/custompopupmenu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.showProductView, extra: productModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.1,
                  height: size.height * 0.1,
                  child: CachedNetworkImage(
                    imageUrl: productModel.imgUrl,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                //! custom pop up menu
                CustomPopUpMenu(
                  productModel: productModel,
                  id: productModel.id,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      r"$" +
                          (productModel.onsale != 0
                              ? productModel.onsale.toStringAsFixed(2)
                              : double.parse(productModel.price)
                                  .toStringAsFixed(2)),
                      style: AppStyles.style18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Visibility(
                      visible: productModel.isOnSale,
                      child: Text(
                        productModel.price,
                        style: AppStyles.style15.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  productModel.piece == 0 ? "1Kg" : "piece",
                  style: AppStyles.style15,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              productModel.title,
              style: AppStyles.style20,
            )
          ],
        ),
      ),
    );
  }
}
