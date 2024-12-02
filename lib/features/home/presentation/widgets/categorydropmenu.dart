import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CategoryDropMenu extends StatefulWidget {
  const CategoryDropMenu({super.key, required this.onchanged});
  final ValueChanged<String> onchanged;

  @override
  State<CategoryDropMenu> createState() => _CategoryDropMenuState();
}

class _CategoryDropMenuState extends State<CategoryDropMenu> {
  String catValue = "Vegetables";
  @override
  Widget build(BuildContext context) {
    var utils = Utils(context);
    Color color = utils.color();
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        style: TextStyle(color: color),
        items: const [
          DropdownMenuItem(
            value: AppStrings.vegtables,
            child: Text(AppStrings.vegtables),
          ),
          DropdownMenuItem(
            value: AppStrings.fruits,
            child: Text(AppStrings.fruits),
          ),
          DropdownMenuItem(
            value: AppStrings.spices,
            child: Text(AppStrings.spices),
          ),
          DropdownMenuItem(
            value: AppStrings.nuts,
            child: Text(AppStrings.nuts),
          ),
          DropdownMenuItem(
            value: AppStrings.herbs,
            child: Text(AppStrings.herbs),
          ),
          DropdownMenuItem(
            value: AppStrings.grains,
            child: Text(AppStrings.grains),
          ),
        ],
        onChanged: (value) {
          setState(() {
            catValue = value!;
          });
          widget.onchanged(value!);
        },
        value: catValue,
      ),
    );
  }
}
