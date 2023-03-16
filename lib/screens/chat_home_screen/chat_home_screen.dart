import 'package:febe_frontend/screens/chat_home_screen/post_card.dart';
import 'package:febe_frontend/screens/chat_home_screen/user_card.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FullScreenContainer(
          child: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          UserCard(),
          SizedBox(
            height: 30,
          ),
          PostCard()
        ],
      )),
    );
  }
}
