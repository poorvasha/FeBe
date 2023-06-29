import 'package:febe_frontend/screens/chat_screen/chat_appbar.dart';
import 'package:febe_frontend/screens/chat_screen/chat_message.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';

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
                children: const [
                  ChatMessage(
                      messageType: "receiver", message: "Welcome to FEBE"),
                ],
              )),
              const MessageBox(
                isDisabled: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
