import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/chat_screen/chat_appbar.dart';
import 'package:febe_frontend/screens/chat_screen/chat_message.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'message_box.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const ChatAppbar(),
      body: SafeArea(
        child: FullScreenContainer(
          disablePadding: true,
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                reverse: true,
                children: [
                  ChatMessage(
                      messageType: "receiver", message: "Welcome to FEBE"),
                ],
              )),
              MessageBox(
                isDisabled: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
