import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GetStartedCarouselIndicator extends StatefulWidget {
  final int total;
  final int current;
  const GetStartedCarouselIndicator(
      {super.key, required this.total, required this.current});

  @override
  State<GetStartedCarouselIndicator> createState() =>
      _GetStartedCarouselIndicatorState();
}

class _GetStartedCarouselIndicatorState
    extends State<GetStartedCarouselIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: new List<int>.generate(widget.total, (i) => i + 1)
            .map((index) => Indicator(isActive: index == widget.current))
            .toList(),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    double size = 20.0;
    return new Container(
        width: size,
        height: size,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: new BoxDecoration(
          color: isActive ? AppColors.golden : AppColors.lightWhite,
          shape: BoxShape.circle,
        ),
        child: new SizedBox());
  }
}
