import 'package:admingrocerypanel/core/widgets/responsive.dart';

import 'package:admingrocerypanel/features/home/presentation/widgets/dashboardbody.dart';
import 'package:admingrocerypanel/core/widgets/sideMenu.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDeskTop(context)) const SideMenu(),
        const SizedBox(
          width: 16,
        ),
        const Expanded(child: DashBoardBody()),
      ],
    );
  }
}
