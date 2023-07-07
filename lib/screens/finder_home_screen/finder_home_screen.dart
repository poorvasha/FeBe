import 'package:febe_frontend/screens/finder_home_screen/user_designations.dart';
import 'package:febe_frontend/screens/finder_home_screen/user_industries.dart';
import 'package:febe_frontend/screens/finder_home_screen/user_type_picker.dart';
import 'package:febe_frontend/screens/nearby_users_screen/nearby_users_screen.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';

import '../../configs/resources.dart';
import '../finder_user_search_screen/finder_user_search_screen.dart';
import '../user_type_screen/user_type_card.dart';

class FinderHomeScreen extends StatefulWidget {
  const FinderHomeScreen({super.key});

  @override
  State<FinderHomeScreen> createState() => _FinderHomeScreenState();
}

class _FinderHomeScreenState extends State<FinderHomeScreen> {
  String userType = "";
  bool isFinderTapped = false;

  void navigateToNearbyUsersScreen(String targetIdentity) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FinderUserSearchScreen(
            targetUserType: targetIdentity == "enabler"
                ? UserType.enabler
                : UserType.entrepreneur),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(
        goBack: false,
        title: "Finder",
      ),
      body: FullScreenContainer(
          isInsideTabbar: true,
          child: Column(
            children: [
              Image.asset(
                "assets/images/search.png",
                height: 250,
              ),
              Text(
                "Select whom you want to connect with",
                style: AppTextStyles.regularBeVietnamPro16.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              UserTypeCard(
                title: "Enabler",
                subtitle:
                    "One who helps the entreprenuers to achieve their goals",
                onTap: () => {navigateToNearbyUsersScreen("enabler")},
              ),
              const SizedBox(
                height: 24,
              ),
              UserTypeCard(
                // image: Image.asset("assets/images/enteruper.png"),
                title: "Entrepreneur",
                subtitle:
                    "One who drives the growth of the product and visions its benefits",
                onTap: () => {navigateToNearbyUsersScreen("entrepreneur")},
              ),
            ],
          )),
    );
  }
}
