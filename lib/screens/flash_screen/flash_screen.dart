import 'dart:convert';

import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/routes.dart';
import '../../models/misc/local_storage_item.dart';
import '../../providers/app_model.dart';
import '../../services/secure_local_storage.dart';

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
      backgroundColor: AppColors.white,
      body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          color: AppColors.white,
          child: Center(child: Image.asset("assets/images/xander_media.png"))),
    );
  }

  Future<bool> _isSignupCompleted(User user) async {
    UserType? userType = await AppHelper.getUserType();
    if (userType == null) {
      return false;
    }

    if (userType == UserType.enabler) {
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
      AppHelper.setUserDetails(user);

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
