import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import '../../configs/resources.dart';
import '../../widgets/default_appbar.dart';

class LocationAccessScreen extends StatefulWidget {
  final bool shouldGoBack;

  const LocationAccessScreen({super.key, this.shouldGoBack = true});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  bool _shouldCheckForLocation = false;

  @override
  Widget build(BuildContext context) {
    void requestToTurnOnLocation() async {
      Location location = Location();
      bool ison = await location.serviceEnabled();
      if (!ison) {
        await location.requestService();
      }
    }

    void navigateToTurnOnAppPermissionSettings() async {
      await Geolocator.openLocationSettings();
    }

    void requestPermission() async {
      LocationPermission locationPermission =
          await AppHelper.requestLocationPermission(context);

      if (locationPermission == LocationPermission.deniedForever) {
        return navigateToTurnOnAppPermissionSettings();
      }
    }

    void goBack() {
      Navigator.pop(context);
    }

    void checkforLocationStatus() async {
      LocationStatus locationStatus =
          await AppHelper.getLocationStatus(context);

      if (locationStatus == LocationStatus.turnedOff) {
        return requestToTurnOnLocation();
      }

      if (locationStatus == LocationStatus.blocked) {
        return navigateToTurnOnAppPermissionSettings();
      }

      if (locationStatus == LocationStatus.denied ||
          locationStatus == LocationStatus.yetToRequest) {
        return requestPermission();
      }

      goBack();
    }

    void onAllowUsTapped() {
      if (!_shouldCheckForLocation) {
        setState(() {
          _shouldCheckForLocation = true;
        });
      }
      checkforLocationStatus();
    }

    return FocusDetector(
      onFocusGained: _shouldCheckForLocation ? checkforLocationStatus : null,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: DefaultAppbar(
          title: "Location",
          goBack: widget.shouldGoBack,
        ),
        body: WillPopScope(
          onWillPop: () async => widget.shouldGoBack,
          child: FullScreenContainer(
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset("assets/images/trail_map.png"),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Current Location",
                style: AppTextStyles.extraBoldBeVietnamPro
                    .copyWith(color: AppColors.golden, fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "To provide better experience",
                style: AppTextStyles.regularBeVietnamPro16
                    .copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Please allow us the following permissions",
                style: AppTextStyles.regularBeVietnamPro16
                    .copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: onAllowUsTapped,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.golden,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  child: Text(
                    "Allow us",
                    style: AppTextStyles.semiBoldBeVietnamPro16
                        .copyWith(color: AppColors.white, fontSize: 20),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
