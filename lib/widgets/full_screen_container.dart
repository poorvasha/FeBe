import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FullScreenContainer extends StatelessWidget {
  final Widget child;
  const FullScreenContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        child: child,
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
