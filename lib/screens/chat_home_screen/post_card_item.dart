import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostCardItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  const PostCardItem({super.key, required this.title, this.subTitle});

  final double CARD_WIDTH = 150;
  final double CARD_HEIGHT = 80;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CARD_HEIGHT,
      width: CARD_WIDTH,
      decoration: BoxDecoration(
        color: AppColors.golden,
        borderRadius: BorderRadius.circular(7),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  subTitle != null
                      ? Text(
                          subTitle!,
                          style: AppTextStyles.semiBoldBeVietnamPro16.copyWith(
                              color: AppColors.white,
                              letterSpacing: 1.5,
                              fontSize: 18),
                        )
                      : const SizedBox(),
                  Text(
                    title,
                    style: AppTextStyles.semiBoldBeVietnamPro16.copyWith(
                        color: AppColors.white,
                        letterSpacing: 1.5,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: SvgPicture.asset(
                "assets/images/wave_2.svg",
                width: CARD_WIDTH,
              ))
        ]),
      ),
    );
  }
}
