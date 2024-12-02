import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/utils/utils.dart';
import 'package:flutter/material.dart';

class ThemeModeIcon extends StatelessWidget {
  const ThemeModeIcon({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color();
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: AppStyles.style18.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
