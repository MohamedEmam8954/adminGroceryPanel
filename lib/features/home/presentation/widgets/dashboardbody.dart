import 'package:admingrocerypanel/core/function/navgation.dart';
import 'package:admingrocerypanel/core/utils/app_router.dart';
import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/utils/dependency_injection.dart';
import 'package:admingrocerypanel/core/widgets/responsive.dart';
import 'package:admingrocerypanel/features/home/data/repo/repo/homerepoimp.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/custombuttons.dart';
import 'package:admingrocerypanel/core/widgets/headerwidget.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/orderlistItems.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/productgridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller: ScrollController(),
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeaderWidget(
                title: AppStrings.dashBoard,
                ontap: () {
                  context.read<MenuCubit>().controlHomeView();
                }),
            const SizedBox(
              height: 15,
            ),
            Text(
              AppStrings.latestProduct,
              style: AppStyles.style15,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBtn(
                    text: AppStrings.viewAll,
                    backgroundcolor: Colors.blue,
                    onpressed: () {},
                    icon: Icons.store),
                CustomBtn(
                    text: AppStrings.addProduct,
                    backgroundcolor: Colors.blue,
                    onpressed: () {
                      navTo(context, AppRouter.addProductView);
                    },
                    icon: Icons.add)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            //! gridviewproduct
            Responsive(
              mobile: ProductGridView(
                crossAxisCount: size.width < 750 ? 2 : 4,
                childAspectRatio:
                    size.width < 650 && size.width > 350 ? 1.1 : 0.8,
              ),
              desktop: ProductGridView(
                childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "orders",
                style: AppStyles.style16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const OrderListItems(),
          ],
        ),
      ),
    );
  }
}
