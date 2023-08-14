import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/chat_screen/febe_chat_item.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/data/user.dart';
import '../../providers/app_model.dart';
import '../../services/chat_service.dart';
import '../../utils/app_helper.dart';
import 'chat_item.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({super.key, required this.currentUser});
  final User currentUser;
  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchChats();
  }

  void fetchChats() async {
    try {
      List<User> currentChats = await ChatService.getChats();
      context.read<AppModel>().setChats = currentChats;
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<AppModel>().getChats.isNotEmpty
        ? ListView.builder(
            itemCount: context.watch<AppModel>().getChats.length,
            itemBuilder: (BuildContext context, int index) {
              return ChatItem(
                currentUser: widget.currentUser,
                selectChatIndex: index,
                isVerified: false,
              );
            },
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/chats_not_found.png",
                ),
                Text(
                  "You have no chats right now, find your fellow collegue using the Finder!",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regularBeVietnamPro12.copyWith(fontSize: 14),
                )
              ],
            ),
          );
  }
}
