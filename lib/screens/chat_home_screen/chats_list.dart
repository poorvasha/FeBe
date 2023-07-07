import 'package:febe_frontend/screens/chat_screen/febe_chat_item.dart';
import 'package:flutter/widgets.dart';

import 'chat_item.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({super.key});

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return  ChatItem(
          selectChatIndex: index,
          isVerified: false,
        );
      },
    );
  }
}
