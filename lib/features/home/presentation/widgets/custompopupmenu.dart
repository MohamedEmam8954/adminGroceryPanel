import 'dart:developer';
import 'package:admingrocerypanel/core/function/navgation.dart';
import 'package:admingrocerypanel/core/models/blocObserver.dart';
import 'package:admingrocerypanel/core/utils/app_router.dart';
import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/utils/utils.dart';
import 'package:admingrocerypanel/features/home/data/model/product_model.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu(
      {super.key, required this.id, required this.productModel});
  final String id;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var dataCubit = context.read<Datacubit>();
    var utils = Utils(context);
    var color = utils.color();
    return PopupMenuButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      onSelected: (value) {
        if (value == '1') {
          navTo(context, AppRouter.showProductView);
          GoRouter.of(context)
              .push(AppRouter.showProductView, extra: productModel);
        } else {
          dataCubit.deleteproduct(id: id);
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "1",
            child: Text(
              AppStrings.edit,
              style: AppStyles.style15.copyWith(
                color: color,
              ),
            ),
          ),
          PopupMenuItem(
            // ignore: sort_child_properties_last
            child: Text(
              AppStrings.delete,
              style: AppStyles.style15.copyWith(
                color: Colors.red,
              ),
            ),
            value: "2",
          ),
        ];
      },
    );
  }
}
