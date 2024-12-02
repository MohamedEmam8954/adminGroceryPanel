import 'package:flutter/material.dart';

class LoadingManager extends StatelessWidget {
  const LoadingManager(
      {super.key, required this.isloading, required this.child});
  final bool isloading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        isloading
            ? Container(
                color: Colors.black.withOpacity(0.6),
              )
            : Container(),
        isloading
            ? const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container()
      ],
    );
  }
}
