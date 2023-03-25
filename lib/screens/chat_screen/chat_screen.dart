import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/screens/chat_screen/chat_appbar.dart';
import 'package:febe_frontend/screens/chat_screen/chat_message.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'message_box.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final bool isVerified;
  final bool isFEBE;
  const ChatScreen(
      {super.key,
      required this.name,
      required this.isVerified,
      this.isFEBE = false});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: ChatAppbar(
        name: widget.name,
        isVerified: widget.isVerified,
        isFEBE: widget.isFEBE,
      ),
      body: SafeArea(
        child: FullScreenContainer(
          disablePadding: true,
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                reverse: false,
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
