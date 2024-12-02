import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/widgets/responsive.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/core/widgets/headerwidget.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/orderlistItems.dart';
import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAllorderBody extends StatelessWidget {
  const ViewAllorderBody({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              HeaderWidget(
                  title: AppStrings.allOrders,
                  ontap: () {
                    context.read<MenuCubit>().controlAllOrderMenu();
                  }),
              const SizedBox(
                height: 15,
              ),
              const OrderListItems(),
            ],
          ),
        )),
      ],
    );
  }
}
