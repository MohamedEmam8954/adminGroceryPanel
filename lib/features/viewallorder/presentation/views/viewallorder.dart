import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:admingrocerypanel/features/viewallorder/presentation/widget/viewallOrderbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAllOrder extends StatelessWidget {
  const ViewAllOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        key: context.read<MenuCubit>().getAllOrderScaffoldKey,
        drawer: const SideMenu(),
        body: const ViewAllorderBody(),
      ),
    );
  }
}
