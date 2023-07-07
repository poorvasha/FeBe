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
  final UserType type;
  final String title;
  const NearbyUsersScreen(
      {super.key,
      required this.targetIdentity,
      required this.type,
      required this.title});

  @override
  State<NearbyUsersScreen> createState() => _NearbyUsersScreenState();
}

class _NearbyUsersScreenState extends State<NearbyUsersScreen> {
  Future<List<User>> fetchNearbyUsers() async {
    Position? position = await AppHelper.getUserCurrentLocation(context);
    if (position == null) {
      throw Error();
    }
    List<User> usersResponse = await FinderService.getNearbyUsers(
        position.latitude,
        position.longitude,
        SEARCH_RADIUS,
        widget.type == UserType.enabler ? "enabler" : "entrepreneur",
        widget.targetIdentity);
    return usersResponse;
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
          future: fetchNearbyUsers(),
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Something went wrong, please try again",
                    style: AppTextStyles.semiBoldBeVietnamPro16
                        .copyWith(color: AppColors.black),
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
                          .copyWith(color: AppColors.black, height: 1.5),
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
