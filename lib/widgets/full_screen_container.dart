import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FullScreenContainer extends StatelessWidget {
  final Widget child;
  final bool disablePadding;
  final bool isInsideTabbar;
  const FullScreenContainer(
      {super.key,
      required this.child,
      this.disablePadding = false,
      this.isInsideTabbar = false});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        height: !isInsideTabbar
            ? height - kToolbarHeight - 40
            : height - kToolbarHeight,
        width: width,
        child: child,
        padding: !disablePadding
            ? const EdgeInsets.all(24)
            : const EdgeInsets.all(0),
      ),
    );
  }
}
