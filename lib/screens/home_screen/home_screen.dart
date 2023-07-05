import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/finder_home_screen/finder_home_screen.dart';
import 'package:febe_frontend/screens/location_access_screen/location_access_screen.dart';
import 'package:febe_frontend/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/app_helper.dart';
import '../chat_home_screen/chat_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeTab = 0;

  List<Widget> tabs = [
    const ChatHomeScreen(),
    const FinderHomeScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    initiateLocationService();
    super.initState();
  }

  void initiateLocationService() async {
    LocationStatus locationStatus = await AppHelper.getLocationStatus(context);
    if (locationStatus != LocationStatus.granted) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const LocationAccessScreen(
                  shouldGoBack: false,
                ),
            fullscreenDialog: true),
      );
    }
    AppHelper.watchUserLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.lightGolden,
        selectedIndex: activeTab,
        onDestinationSelected: (int index) {
          setState(() {
            activeTab = index;
          });
        },
        indicatorColor: AppColors.goldenTint,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.message,
              color: AppColors.darkGolden,
            ),
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.travel_explore,
              color: AppColors.darkGolden,
            ),
            icon: Icon(Icons.travel_explore),
            label: 'Finder',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: AppColors.darkGolden,
            ),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: tabs[activeTab],
    );
  }
}
