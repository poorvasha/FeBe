import 'package:flutter/material.dart';

class FullScreenContainer extends StatelessWidget {
  final Widget child;
  final bool disablePadding;
  final bool isInsideTabbar;
  final bool fullScreen;
  const FullScreenContainer(
      {super.key,
      required this.child,
      this.disablePadding = false,
      this.isInsideTabbar = false,
      this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: fullScreen
          ? height
          : !isInsideTabbar
              ? height - kToolbarHeight - 40
              : height - kToolbarHeight,
      width: width,
      padding:
          !disablePadding ? const EdgeInsets.all(24) : const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
