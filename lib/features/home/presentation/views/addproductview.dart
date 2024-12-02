import 'package:admingrocerypanel/core/utils/dependency_injection.dart';
import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/addproductbody.dart';
import 'package:admingrocerypanel/features/home/data/repo/repo/homerepoimp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: context.read<MenuCubit>().getAddProductScaffoldKey,
        drawer: const SideMenu(),
        body: const AddProductBody(),
      ),
    );
  }
}
