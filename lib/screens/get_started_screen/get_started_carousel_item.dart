import 'package:febe_frontend/models/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../configs/resources.dart';

class GetStartedCarouselItem extends StatelessWidget {
  final CarouselItem carousel;
  const GetStartedCarouselItem({super.key, required this.carousel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(carousel.image),
          const SizedBox(
            height: 30,
          ),
          Text(carousel.title,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.extraBoldBeVietnamPro
                  .copyWith(color: AppColors.golden, fontSize: 30.0)),
          const SizedBox(
            height: 20,
          ),
          Text(carousel.description,
              textAlign: TextAlign.center,
              style: AppTextStyles.regularBeVietnamPro16.copyWith(
                  color: AppColors.lightWhite, fontSize: 16.0, height: 1.5)),
        ],
      ),
    );
  }
}
