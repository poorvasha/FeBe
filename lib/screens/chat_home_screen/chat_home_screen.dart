import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/chat_home_screen/chats_list.dart';
import 'package:febe_frontend/services/chat_service.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/data/user.dart';
import '../../providers/app_model.dart';
import '../../services/user_service.dart';
import '../../utils/app_helper.dart';
import '../chat_screen/febe_chat_item.dart';
import 'empty_chat.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  User user = User();
  List<User> chats = [];

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
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: const DefaultAppbar(
        title: "Recents",
        goBack: false,
      ),
      body: FullScreenContainer(
          isInsideTabbar: true,
          disablePadding: true,
          child: Column(
            children: [
              FebeChatItem(),
              // EmptyChat(),
              Expanded(child: ChatsList(currentUser: user)),
            ],
          )),
    );
  }
}
