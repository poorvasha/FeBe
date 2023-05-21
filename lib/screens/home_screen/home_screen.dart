import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/finder_home_screen/finder_home_screen.dart';
import 'package:febe_frontend/screens/location_access_screen/location_access_screen.dart';
import 'package:febe_frontend/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_helper.dart';
import '../chat_home_screen/chat_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double ICON_WIDTH = 30;
  double ICON_HEIGHT = 30;

  int activeTab = 0;

  List<Widget> tabs = [ChatHomeScreen(), FinderHomeScreen(), ProfileScreen()];

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
            builder: (context) => LocationAccessScreen(
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
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.lightBlack,
          selectedItemColor: AppColors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  boxShadow: activeTab == 0
                      ? const [
                          BoxShadow(
                              color: AppColors.lightWhite,
                              offset: Offset(0, 0),
                              blurRadius: 100,
                              spreadRadius: 0.5)
                        ]
                      : [],
                ),
                width: ICON_WIDTH,
                height: ICON_HEIGHT,
                child: SvgPicture.asset("assets/icons/home.svg"),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  boxShadow: activeTab == 1
                      ? const [
                          BoxShadow(
                              color: AppColors.lightWhite,
                              offset: Offset(0, 0),
                              blurRadius: 100,
                              spreadRadius: 0.5)
                        ]
                      : [],
                ),
                height: ICON_WIDTH,
                width: ICON_HEIGHT,
                child: SvgPicture.asset("assets/icons/map.svg"),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  boxShadow: activeTab == 2
                      ? const [
                          BoxShadow(
                              color: AppColors.lightWhite,
                              offset: Offset(0, 0),
                              blurRadius: 100,
                              spreadRadius: 0.5)
                        ]
                      : [],
                ),
                height: ICON_WIDTH,
                width: ICON_HEIGHT,
                child: SvgPicture.asset("assets/icons/user.svg"),
              ),
              label: "",
            ),
          ],
          onTap: (value) => {
            setState(() {
              activeTab = value;
            })
          },
        ),
      ),
      body: tabs[activeTab],
    );
  }
}
