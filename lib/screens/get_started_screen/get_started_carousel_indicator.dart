import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';

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
        children: List<int>.generate(widget.total, (i) => i + 1)
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
    double size = 8.0;
    return  Container(
        width: size,
        height: size,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: isActive ? AppColors.golden : AppColors.extraLightBlue,
          shape: BoxShape.circle,
        ),
        child: const SizedBox());
  }
}
