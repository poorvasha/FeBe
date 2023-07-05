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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      title: Text(
        user.name!,
        style: AppTextStyles.mediumBeVietnamPro
            .copyWith(fontSize: 16, color: AppColors.black),
      ),
      subtitle: Text(
        user.enabler?.about ?? user.entrepreneur?.about ?? "-",
        style: AppTextStyles.regularBeVietnamPro12
            .copyWith(fontSize: 14, color: AppColors.lightGray),
      ),
      leading: CircleAvatar(
          backgroundColor: AppColors.lightGolden,
          radius: 25,
          child: Text(
            user.name![0],
            style: AppTextStyles.mediumBeVietnamPro
                .copyWith(fontSize: 16, color: AppColors.golden),
          )),
      trailing: IconButton(
        icon: const Icon(Icons.message, color: AppColors.lightGray),
        onPressed: () {},
      ),
    );
  }
}
