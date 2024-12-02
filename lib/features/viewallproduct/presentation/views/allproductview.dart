import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/widgets/responsive.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/core/widgets/headerwidget.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/productgridview.dart';
import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        key: context.read<MenuCubit>().getGridScaffoldKey,
        drawer: const SideMenu(),
        body: const AllproductBody(),
      ),
    );
  }
}

class AllproductBody extends StatelessWidget {
  const AllproductBody({super.key});

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
            child: Column(
              children: [
                HeaderWidget(
                    title: AppStrings.showProduct,
                    ontap: () {
                      context.read<MenuCubit>().controlProductMenu();
                    }),
                const SizedBox(
                  height: 15,
                ),
                //! gridviewproduct
                Responsive(
                  mobile: ProductGridView(
                    crossAxisCount: size.width < 650 ? 2 : 4,
                    childAspectRatio:
                        size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                  ),
                  desktop: ProductGridView(
                    childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
