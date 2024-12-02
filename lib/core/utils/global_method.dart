import 'dart:developer';
import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/core/widgets/custom_signout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class GlobalMethod {
  static Future warningDialog(context,
      {required String title,
      required String subTitle,
      required VoidCallback ontap}) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CustomSignOut(
            title: title,
          ),
          content: Text(subTitle),
          actions: [
            TextButton(
              onPressed: () {
                //!

                log("Cancel");
                Navigator.pop(context);
              },
              child: Text(
                AppStrings.cancel,
                style: AppStyles.style17,
              ),
            ),
            TextButton(
              onPressed: () {
                ontap();
                Navigator.pop(context);
              },
              child: Text(
                AppStrings.ok,
                style: AppStyles.style17.copyWith(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future errorDialog(
    context, {
    required String subTitle,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const CustomSignOut(
            title: AppStrings.anErrorOccurred,
          ),
          content: Text(subTitle),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(
                AppStrings.ok,
                style: AppStyles.style17.copyWith(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
  //!(_)(_)!\\
}
