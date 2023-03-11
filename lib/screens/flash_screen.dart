import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/routes.dart';
import '../providers/app_model.dart';

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
      backgroundColor: AppColors.brown,
      body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          color: Theme.of(context).backgroundColor,
          child: Center(child: Image.asset("assets/images/xander_media.png"))),
    );
  }

  void setIntialScreen() async {
    AppHelper().checkIsUserLoggedIn().then((isUserLoggedIn) {
      context.read<AppModel>().setInitialRoute =
          isUserLoggedIn ? Routes.userTypeScreen : Routes.userTypeScreen;
    });
  }
}
