import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../configs/resources.dart';

class ChatItem extends StatefulWidget {
  final bool isVerified;
  const ChatItem({super.key, this.isVerified = false});

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            ClipOval(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.golden,
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
                      widget.isVerified
                          ? const Icon(
                              Icons.verified,
                              color: AppColors.white,
                            )
                          : const SizedBox()
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
