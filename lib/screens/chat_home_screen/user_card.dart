import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

class UserCard extends StatelessWidget {
  final String name;
  final bool isVerified;
  final String locationName;
  final Function()? onLocationTap;
  UserCard(
      {super.key,
      required this.name,
      this.isVerified = false,
      required this.locationName,
      this.onLocationTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.golden,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Image.asset(
                "assets/images/user_avatar.png",
                height: 60,
                width: 60,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: AppTextStyles.semiBoldBeVietnamPro16
                  .copyWith(color: AppColors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              name,
              style: AppTextStyles.semiBoldBeVietnamPro16
                  .copyWith(color: AppColors.golden),
            ),
            const SizedBox(
              height: 10,
            ),
            if (isVerified)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.golden,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(children: [
                  Text(
                    "Verified",
                    style: AppTextStyles.semiBoldBeVietnamPro16
                        .copyWith(color: AppColors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.verified,
                    color: AppColors.white,
                  )
                ]),
              )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Container(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: onLocationTap ?? null,
            child: Container(
              width: 160,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.lightBlack,
                  boxShadow: AppShaddows.customShadow,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(children: [
                SvgPicture.asset("assets/icons/location_pin.svg"),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  locationName,
                  style: AppTextStyles.semiBoldBeVietnamPro16
                      .copyWith(color: AppColors.golden),
                ),
              ]),
            ),
          ),
        ))
      ],
    );
  }
}
