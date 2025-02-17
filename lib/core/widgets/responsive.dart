import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key, required this.mobile, required this.desktop});
  final Widget mobile, desktop;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;
  static bool isDeskTop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (size.width >= 1100) {
      return desktop;
    } else {
      return mobile;
    }
  }
}
