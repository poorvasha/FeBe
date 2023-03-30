import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/services/secure_local_storage.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/routes.dart';
import '../../providers/app_model.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () => setIntialScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          color: Theme.of(context).backgroundColor,
          child: Center(child: Image.asset("assets/images/xander_media.png"))),
    );
  }

  Future<bool> _isSignupCompleted(User user) async {
    String? userType = await AppHelper.getUserType();
    if (userType == null) {
      return false;
    }

    if (userType == "enabler") {
      return user.enabler?.about != null;
    }

    return user.entrepreneur?.about != null;
  }

  void setIntialScreen() async {
    bool isUserLoggedIn = await AppHelper().checkIsUserLoggedIn();
    if (!isUserLoggedIn) {
      context.read<AppModel>().setInitialRoute = Routes.userTypeScreen;
      return;
    }

    try {
      User user = await UserService.getUser();
      bool isSignupCompleted = await _isSignupCompleted(user);

      if (isSignupCompleted) {
        context.read<AppModel>().setInitialRoute = Routes.homeScreen;
        return;
      }
      context.read<AppModel>().setInitialRoute = Routes.userDetailScreen;
    } catch (e) {
      context.read<AppModel>().setInitialRoute = Routes.userTypeScreen;
    }
  }
}
