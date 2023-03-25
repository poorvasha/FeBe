import 'package:febe_frontend/screens/chat_screen/febe_chat_item.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        FebeChatItem(),
        // ...List.generate(10, //this is the total number of cards
        //     (index) {
        //   return ChatItem(isVerified: false);
        // })
      ],
    );
  }
}
