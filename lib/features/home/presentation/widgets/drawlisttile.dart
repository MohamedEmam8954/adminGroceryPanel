import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/utils/utils.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.icon,
      required this.ontap,
      required this.title});
  final IconData icon;
  final VoidCallback ontap;
  final String title;
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color();
    return ListTile(
      horizontalTitleGap: 10,
      onTap: ontap,
      leading: Icon(
        icon,
        size: 18,
        color: color,
      ),
      title: Text(
        title,
        style: AppStyles.style18.copyWith(
          color: color,
        ),
      ),
    );
  }
}
