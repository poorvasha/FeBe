import 'package:flutter/material.dart';

import '../../configs/resources.dart';

class UserBasicInfo extends StatelessWidget {
  const UserBasicInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.white,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Image.asset(
                "assets/images/user_avatar.png",
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Prem Kumar",
                style: AppTextStyles.regularBeVietnamPro24.copyWith(
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(children: [
                  Text(
                    "Verified",
                    style: AppTextStyles.semiBoldBeVietnamPro16
                        .copyWith(color: AppColors.golden),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.verified,
                    color: AppColors.golden,
                  )
                ]),
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: AppColors.white,
            weight: 3,
            size: 30,
          ),
        )
      ],
    );
  }
}
