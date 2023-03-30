import 'package:febe_frontend/screens/chat_home_screen/chats_list.dart';
import 'package:febe_frontend/screens/chat_home_screen/post_card.dart';
import 'package:febe_frontend/screens/chat_home_screen/user_card.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/data/user.dart';
import '../../services/user_service.dart';
import '../../utils/app_helper.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  User? user;

  @override
  void initState() {
    fetchUserDetails();
    super.initState();
  }

  void fetchUserDetails() async {
    try {
      User currentUser = await UserService.getUser();
      setState(() {
        user = currentUser;
      });
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void navigateToMapScreen() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FullScreenContainer(
          isInsideTabbar: true,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              UserCard(
                name: user?.name ?? "User",
                locationName: "Navalur",
                onLocationTap: navigateToMapScreen,
              ),
              const SizedBox(
                height: 30,
              ),
              // const PostCard(),
              // const SizedBox(
              //   height: 30,
              // ),
              const Expanded(child: ChatsList())
            ],
          )),
    );
  }
}
