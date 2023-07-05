import 'package:febe_frontend/configs/constants.dart';
import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/enabler.dart';
import 'package:febe_frontend/models/data/entrepreneur.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/screens/nearby_users_screen/nearby_user_card.dart';
import 'package:febe_frontend/services/finder_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../widgets/default_loader.dart';

class NearbyUsersScreen extends StatefulWidget {
  final String targetIdentity;
  final String type;
  final String title;
  final double? userLatitude;
  final double? userLongitude;
  const NearbyUsersScreen(
      {super.key,
      required this.targetIdentity,
      required this.type,
      required this.title,
      this.userLatitude,
      this.userLongitude});

  @override
  State<NearbyUsersScreen> createState() => _NearbyUsersScreenState();
}

class _NearbyUsersScreenState extends State<NearbyUsersScreen> {
  List<User> users = [];

  Future<List<User>> fetchNearbyUsers() async {
    Position? position = await AppHelper.getUserCurrentLocation(context);
    if (position == null) {
      throw Error();
    }
    List<User> usersResponse = await FinderService.getNearbyUsers(
        position.latitude,
        position.longitude,
        SEARCH_RADIUS,
        widget.type,
        widget.targetIdentity);
    return usersResponse;
  }

  Future<List<User>> mockNearbyUsers() async {
    return [
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler: Enabler(
              about:
                  "Full stack mobile app developer 🚀 | Mentor 🎯 | UI/UX Designer ✅"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS")),
      User(
          name: "Navayuvan SB",
          phoneNumber: "6384017614",
          enabler:
              Enabler(about: "I'm a passionate developer with skills in JS"),
          entrepreneur: Entrepreneur(
              about: "I'm a passionate developer with skills in JS"))
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(title: widget.title),
      body: FullScreenContainer(
        disablePadding: true,
        child: FutureBuilder(
          future: mockNearbyUsers(),
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Something went wrong, please try again",
                    style: AppTextStyles.semiBoldBeVietnamPro16
                        .copyWith(color: AppColors.white),
                  ),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data as List<User>;

                if (data.isEmpty) {
                  return Center(
                    child: Text(
                      "No users found for your location, please try someother designation",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.semiBoldBeVietnamPro16
                          .copyWith(color: AppColors.white, height: 1.5),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    User currentUser = data[index];
                    return NearbyUserCard(
                      user: currentUser,
                    );
                  },
                );
              }
            }

            // Displaying LoadingSpinner to indicate waiting state
            return const Center(
              child: DefaultLoader(),
            );
          },
        ),
      ),
    );
  }
}
