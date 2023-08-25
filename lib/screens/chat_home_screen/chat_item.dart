import 'package:febe_frontend/models/data/all_chats_data_model.dart';
import 'package:febe_frontend/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


import '../../configs/resources.dart';
import '../../models/data/user.dart';
class ChatItem extends StatefulWidget {
  final bool isVerified;
  int selectChatIndex;
  User currentUser;
  ChatsData chatDetails;
  ChatItem({super.key, required this.currentUser, this.selectChatIndex = 0, this.isVerified = false, required this.chatDetails});

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    //fetchChats();
  }
    
    void navigateToChatScreen() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  ChatScreen(
                    currentUser : widget.currentUser,
                    name: "",
                    isVerified: false,
                    chatDetails : widget.chatDetails
                  )));
    }

    return ListTile(
      onTap: (){
        navigateToChatScreen();
      },
      leading: CircleAvatar(
        backgroundColor: AppColors.lightGolden,
        child: Text(
          widget.chatDetails.targetUser!.name!.substring(0,1).toUpperCase(),
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.lightBlack),
        ),
      ),
      title: Text(
        widget.chatDetails.targetUser!.name!,
        style: AppTextStyles.regularBeVietnamPro16
            .copyWith(color: AppColors.black),
      ),
      subtitle: Text(
        widget.chatDetails.recentMessage!.text!,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.regularBeVietnamPro16
            .copyWith(color: AppColors.lightGray, fontSize: 14),
      ),
      trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Expanded(
          child: Text(
          DateFormat.jm().format(DateTime.parse(widget.chatDetails.recentMessage!.createdAt!)),
            style: AppTextStyles.mediumBeVietnamPro.copyWith(
                color: AppColors.black, fontSize: 11, letterSpacing: -0.5),
          ),
        ),
        Badge.count(count: widget.chatDetails.unreadCount!.toInt()),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
