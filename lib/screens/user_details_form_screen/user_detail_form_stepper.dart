import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserDetailFormStepper extends StatelessWidget {
  final int activeIndex;
  const UserDetailFormStepper({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 680,
      decoration: const BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.golden,
              offset: Offset(0, 2),
              blurRadius: 4,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, top: 8),
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1",
                  style: AppTextStyles.regularBeVietnamPro30
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  "2",
                  style: AppTextStyles.regularBeVietnamPro30
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  "3",
                  style: AppTextStyles.regularBeVietnamPro30
                      .copyWith(color: AppColors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                activeIndex == 0
                    ? SvgPicture.asset("assets/images/stepper_indicator.svg")
                    : const SizedBox(),
                activeIndex == 1
                    ? SvgPicture.asset("assets/images/stepper_indicator.svg")
                    : const SizedBox(),
                activeIndex == 2
                    ? SvgPicture.asset("assets/images/stepper_indicator.svg")
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
