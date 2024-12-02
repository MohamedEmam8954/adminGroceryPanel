import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/utils/assets.dart';
import 'package:admingrocerypanel/core/utils/utils.dart';
import 'package:admingrocerypanel/features/home/data/model/order_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class Orderitem extends StatelessWidget {
  const Orderitem({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final utils = Utils(context);
    utils.color();
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.1,
          height: size.height * 0.1,
          child: FancyShimmerImage(
            imageUrl: orderModel.imgUrl,
            boxFit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${orderModel.quantity}xfor\$${orderModel.price}",
              style: AppStyles.style16,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "By ",
                    style: AppStyles.style14.copyWith(color: Colors.blue),
                  ),
                  TextSpan(
                    text: orderModel.userName,
                    style: AppStyles.style15,
                  ),
                ],
              ),
            ),
            Text(
              ("${orderModel.orderDate.toDate().year}/ ${orderModel.orderDate.toDate().month}/${orderModel.orderDate.toDate().day}"),
              style: AppStyles.style14.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
