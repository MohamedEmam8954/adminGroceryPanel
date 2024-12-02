import 'package:admingrocerypanel/core/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    required this.backgroundcolor,
    required this.onpressed,
    required this.icon, // Added icon to constructor
  });

  final String text;
  final Color backgroundcolor;
  final VoidCallback onpressed;
  final IconData icon; // Initialized icon as a final field

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onpressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ), // Added icon to the button
      label: Text(
        text, // Updated to display the passed `text`
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundcolor, // Set the background color
        padding: EdgeInsets.symmetric(
          horizontal: 1.5 * 10,
          vertical: 10 / (Responsive.isDeskTop(context) ? 1 : 2),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Removed border radius
        ),
      ),
    );
  }
}
