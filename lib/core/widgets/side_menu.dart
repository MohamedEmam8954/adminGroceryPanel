import 'package:admingrocerypanel/core/constant/constant.dart';
import 'package:admingrocerypanel/core/function/navgation.dart';
import 'package:admingrocerypanel/core/utils/app_router.dart';
import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/assets.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/appthemecubit/appthemecubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/drawlisttile.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/thememodeicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    bool isLight = context.read<Appthemecubit>().getTheme();

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(Assets.grocries),
          ),
          DrawerListTile(
              icon: Icons.home_filled,
              ontap: () {
                navTo(context, AppRouter.homeView);
              },
              title: AppStrings.main),
          DrawerListTile(
              icon: Icons.store,
              ontap: () {
                navTo(context, AppRouter.allProductView);
              },
              title: AppStrings.viewAllProduct),
          DrawerListTile(
              icon: IconlyBold.bag_2,
              ontap: () {
                navTo(context, AppRouter.viewallOrder);
              },
              title: AppStrings.viewAllOrder),
          SwitchListTile(
            value: isLight,
            onChanged: (value) {
              BlocProvider.of<Appthemecubit>(context)
                  .setTheme(value: value, key: appTheme);
              setState(() {});
            },
            title: !isLight
                ? const ThemeModeIcon(
                    title: AppStrings.lightMode,
                    icon: Icons.light_mode_outlined)
                : const ThemeModeIcon(
                    title: AppStrings.darkMode, icon: Icons.dark_mode_outlined),
          ),
        ],
      ),
    );
  }
}
