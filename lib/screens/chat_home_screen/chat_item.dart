import 'package:febe_frontend/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/resources.dart';
import '../../models/data/user.dart';

class ChatItem extends StatefulWidget {
  final bool isVerified;
  int selectChatIndex;
  User currentUser;
  ChatItem({super.key, required this.currentUser, this.selectChatIndex = 0, this.isVerified = false});

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    void navigateToChatScreen() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  ChatScreen(
                    currentUser : widget.currentUser,
                    name: "",
                    isVerified: false,
                  )));
    }

    return ListTile(
      onTap: (){
        navigateToChatScreen();
      },
      leading: CircleAvatar(
        backgroundColor: AppColors.lightGolden,
        child: Text(
          "F",
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.lightBlack),
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
    );
  }
}
