import 'package:febe_frontend/providers/app_model.dart';
import 'package:febe_frontend/screens/finder_user_search_screen/finder_user_search_screen.dart';
import 'package:febe_frontend/screens/flash_screen/flash_screen.dart';
import 'package:febe_frontend/screens/get_started_screen/get_started_screen.dart';
import 'package:febe_frontend/screens/home_screen/home_screen.dart';
import 'package:febe_frontend/screens/login_screen/login_screen.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_details_form_screen.dart';
import 'package:febe_frontend/screens/user_type_screen/user_type_screen.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'configs/resources.dart';
import 'configs/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloud Contacts',
      theme: ThemeData(
          backgroundColor: AppColors.lightBlack,
          primaryColor: AppColors.golden,
          inputDecorationTheme: AppResources.defaultInputDecoration,
          useMaterial3: true),
      onGenerateRoute: Routes.controller,
      home: displayHome(),
    );
  }

  Widget displayHome() {
    var currentroute = context.watch<AppModel>().getInitialRoute;
    switch (currentroute) {
      case 'flashScreen':
        return const FlashScreen();
      case 'loginScreen':
        return const LoginScreen();
      case 'homeScreen':
        // return const HomeScreen();
        return const FinderUserSearchScreen(
          targetUserType: UserType.entrepreneur,
        );
      case 'getStartedScreen':
        return const GetStartedScreen();
      case 'userTypeScreen':
        return const UserTypeScreen();
      case 'userDetailScreen':
        return const UserDetailsFormScreen();
      default:
        return const LoginScreen();
    }
  }
}
