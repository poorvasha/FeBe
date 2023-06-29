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
              builder: (context) =>
                  const ChatScreen(name: "FEBE", isVerified: true, isFEBE: true)));
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: navigateToChatScreen,
        child: Row(
          children: [
            ClipOval(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.white,
                child: Container(
                  child: Image.asset(
                    "assets/images/xander_media_golden_transparent.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "FEBE",
                        style: AppTextStyles.regularBeVietnamPro20
                            .copyWith(color: AppColors.golden),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.verified,
                        color: AppColors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome Prem",
                    style: AppTextStyles.extraBoldBeVietnamPro
                        .copyWith(fontSize: 14, color: AppColors.white),
                  ),
                ],
              ),
            ),
            Text(
              "7:30 PM",
              style: AppTextStyles.mediumBeVietnamPro
                  .copyWith(fontSize: 12, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
