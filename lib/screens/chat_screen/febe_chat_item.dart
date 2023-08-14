import 'package:febe_frontend/models/data/user.dart';
import 'package:flutter/material.dart';

import '../../configs/resources.dart';
import 'chat_screen.dart';

class FebeChatItem extends StatelessWidget {
  const FebeChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToChatScreen() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatScreen( currentUser: User(),
                  name: "FEBE", isVerified: true, isFEBE: true)));
    }

    return Container(
      color: AppColors.lightGolden,
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundColor: AppColors.golden,
          child: Text(
            "F",
            style: AppTextStyles.regularBeVietnamPro16
                .copyWith(color: AppColors.white),
          ),
        ),
        title: Text(
          "FeBe",
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.black),
        ),
        subtitle: Text(
          "Welcome to FEBE, we’re excited to have you with us",
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.lightGray, fontSize: 14),
        ),
        trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Expanded(
            child: Text(
              "10:00 AM",
              style: AppTextStyles.mediumBeVietnamPro.copyWith(
                  color: AppColors.black, fontSize: 11, letterSpacing: -0.5),
            ),
          ),
          Badge.count(count: 3),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}
