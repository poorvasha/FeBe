import 'package:febe_frontend/screens/flash_screen/flash_screen.dart';
import 'package:febe_frontend/screens/get_started_screen/get_started_screen.dart';
import 'package:febe_frontend/screens/home_screen/home_screen.dart';
import 'package:febe_frontend/screens/login_screen/login_screen.dart';
import 'package:febe_frontend/widgets/user_type_screen/user_type_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String flashScreen = 'flashScreen';
  static const String loginScreen = 'loginScreen';
  static const String getStartedScreen = 'getStartedScreen';
  static const String homeScreen = 'homeScreen';
  static const String userTypeScreen = 'userTypeScreen';

  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case flashScreen:
        return MaterialPageRoute(builder: (context) => const FlashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case getStartedScreen:
        return MaterialPageRoute(
            builder: (context) => const GetStartedScreen());
      case userTypeScreen:
        return MaterialPageRoute(builder: (context) => const UserTypeScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const FlashScreen());
    }
  }
}
