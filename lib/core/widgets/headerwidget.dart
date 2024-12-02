import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/widgets/responsive.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      required this.ontap,
      required this.title,
      this.showTextField = true});
  final VoidCallback ontap;
  final String title;
  final bool showTextField;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Responsive.isMobile(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: ontap,
          ),
        if (Responsive.isDeskTop(context))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: AppStyles.style20.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        if (Responsive.isDeskTop(context))
          Spacer(
            flex: Responsive.isDeskTop(context) ? 2 : 1,
          ),
        showTextField
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppStrings.search,
                      fillColor: Theme.of(context).cardColor,
                      filled: true,
                      enabledBorder: outlineInputBorder(),
                      focusedBorder: outlineInputBorder(),
                      border: outlineInputBorder(),
                      suffixIcon: InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.search,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
  }
}
