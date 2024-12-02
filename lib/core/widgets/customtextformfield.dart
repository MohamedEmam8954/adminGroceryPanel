import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.oncChanged,
      this.validator,
      this.hintext,
      this.controller,
      required this.maxlines,
      this.isauth = false,
      this.suffixicon,
      this.onTapSuffixicon,
      this.obscureText = false,
      this.oneditingcomplete,
      required this.textInputType,
      this.fill = false,
      this.textInputAction,
      this.focusNode,
      this.filledcolor,
      this.inputFormatter});

  final void Function(String)? oncChanged;
  final String? Function(String?)? validator;
  final String? hintext;
  final TextEditingController? controller;
  final int maxlines;
  final bool isauth, fill;
  final IconData? suffixicon;
  final VoidCallback? onTapSuffixicon, oneditingcomplete;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Color? filledcolor;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    // Define hint text color based on the theme

    return TextFormField(
      inputFormatters: inputFormatter != null ? inputFormatter! : [],
      cursorColor: Colors.black,
      focusNode: focusNode,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      onChanged: oncChanged,
      obscureText: obscureText,
      onEditingComplete: oneditingcomplete,
      style: const TextStyle(fontSize: 16, color: Colors.black),
      maxLines: 1,
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 12),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        filled: fill,
        fillColor: filledcolor,
        border: outlinelineInputBorder(),
        enabledBorder: outlinelineInputBorder(),
        focusedBorder: outlinelineInputBorder(),
        hintText: hintext,
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: onTapSuffixicon,
          icon: Icon(
            suffixicon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlinelineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(3), borderSide: BorderSide.none);
  }
}
