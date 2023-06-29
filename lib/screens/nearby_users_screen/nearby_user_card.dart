import 'package:febe_frontend/screens/nearby_users_screen/user_basic_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/resources.dart';
import '../../models/data/user.dart';

class NearbyUserCard extends StatelessWidget {
  final User user;
  const NearbyUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.golden, borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        UserBasicInfo(
          name: user.name!,
          isVerified: true,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              user.enabler?.about ?? user.entrepreneur?.about ?? "Developer",
              style: AppTextStyles.regularBeVietnamPro16
                  .copyWith(color: AppColors.white, height: 1.5),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "2KM Away",
              style: AppTextStyles.mediumBeVietnamPro
                  .copyWith(fontSize: 14, color: AppColors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/send.svg",
                  semanticsLabel: 'Send'),
            )
          ],
        )
      ]),
    );
  }
}
