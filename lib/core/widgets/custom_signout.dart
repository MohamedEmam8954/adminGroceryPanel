import 'package:flutter/material.dart';

class CustomSignOut extends StatelessWidget {
  const CustomSignOut({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "lib/assets/images/groceries.png",
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(title),
      ],
    );
  }
}
