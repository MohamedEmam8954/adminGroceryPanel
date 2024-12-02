import 'package:admingrocerypanel/core/utils/dependency_injection.dart';
import 'package:admingrocerypanel/features/home/data/repo/repo/homerepoimp.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/homeviewbody.dart';
import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        key: context.read<MenuCubit>().getScaffoldKey,
        drawer: const SideMenu(),
        body: const HomeViewBody(),
      ),
    );
  }
}

//  bool isLight = context.read<Appthemecubit>().getTheme();
//     return Scaffold(
//       body: Column(
//         children: [
//           SwitchListTile(
//             value: isLight,
//             onChanged: (value) {
//               log("the val is $value");
//               BlocProvider.of<Appthemecubit>(context)
//                   .setTheme(value: value, key: appTheme);
//               setState(() {});
//             },
//             title: !isLight ? Text("Light Color") : Text("dark Mode"),
//           ),
//         ],
//       ),
//     );
