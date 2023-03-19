import 'package:febe_frontend/screens/nearby_users_screen/user_basic_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/resources.dart';

class NearbyUserCard extends StatelessWidget {
  const NearbyUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.golden, borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        UserBasicInfo(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Text(
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem",
            style: AppTextStyles.regularBeVietnamPro16
                .copyWith(color: AppColors.white, height: 1.5),
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
