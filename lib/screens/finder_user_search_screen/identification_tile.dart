import 'package:flutter/material.dart';

import '../../configs/resources.dart';

class IdentificationTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const IdentificationTile(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      title: Text(
        title,
        style: AppTextStyles.regularBeVietnamPro16
            .copyWith(color: AppColors.black),
      ),
      leading: CircleAvatar(
        backgroundColor: AppColors.lightGolden,
        child: Text(
          title[0],
          style: AppTextStyles.mediumBeVietnamPro
              .copyWith(fontSize: 16, color: AppColors.golden),
        ),
      ),
    );
  }
}
