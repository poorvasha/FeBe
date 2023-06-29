import 'package:febe_frontend/configs/constants.dart';
import 'package:febe_frontend/models/misc/local_storage_item.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../services/secure_local_storage.dart';

enum LocationStatus { turnedOff, denied, blocked, granted, yetToRequest }

class AppHelper {
  Future<bool> checkIsUserLoggedIn() async {
    try {
      var isContainsKey =
          await SecureStorage().containsKeyInSecureData('accessToken');
      if (isContainsKey) {
        var data = await SecureStorage().readSecureData('accessToken');
        if (data != null && data.isNotEmpty) {
          return true;
        }
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  static Future<void> logoutUser() async {
    await SecureStorage().deleteSecureData('accessToken');
  }

  static Future<String?> getUserType() async {
    try {
      var isContainsKey =
          await SecureStorage().containsKeyInSecureData('userType');
      if (isContainsKey) {
        var data = await SecureStorage().readSecureData('userType');
        if (data != null && data.isNotEmpty) {
          return data;
        }
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<void> setAccessToken(String accessToken) async {
    try {
      await SecureStorage().writeSecureData(
          LocalStorageItem(key: "accessToken", value: accessToken));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<void> setUserType(String userType) async {
    try {
      await SecureStorage()
          .writeSecureData(LocalStorageItem(key: 'userType', value: userType));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static bool validateEmail(String email) {
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePassword(String password) {
    if (password.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateName(String email) {
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePhoneNumber(String phoneNumber) {
    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phoneNumber)) {
      return false;
    } else {
      return true;
    }
  }

  static void showSnackbar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String convertSecToMin({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second Sec";
  }

  static Future<bool> isUserUsingForFirstTime() async {
    String? isFirstTime =
        await SecureStorage().readSecureData(IS_USING_FOR_FIRST_TIME_KEY);

    return isFirstTime == null || isFirstTime == "true";
  }

  static Future<XFile?> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    String? result = await showOptionsDialog(
        context, "Where do you want to choose?", ["Gallery", "Camera"]);

    if (result == null) {
      return null;
    }
    final XFile? image = await picker.pickImage(
        source: result == "Gallery" ? ImageSource.gallery : ImageSource.camera);

    return image;
  }

  static Future<String?> showOptionsDialog(
    BuildContext context,
    String title,
    List<String> options,
  ) async {
    String? result = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(title),
            children: options
                .map((e) => SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context, e);
                      },
                      child: Text(e),
                    ))
                .toList(),
          );
        });
    return result;
  }

  static Future<LocationStatus> getLocationStatus(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationStatus.turnedOff;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return LocationStatus.denied;
    }

    if (permission == LocationPermission.unableToDetermine) {
      return LocationStatus.yetToRequest;
    }

    return LocationStatus.granted;
  }

  static Future<bool> _handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  static Future<LocationPermission> requestLocationPermission(
      BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission;
  }

  static Future<Position?> getUserCurrentLocation(BuildContext context) async {
    final hasPermission = await _handleLocationPermission(context);
    if (!hasPermission) return null;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  static void watchUserLocation(BuildContext context) async {
    final hasPermission = await _handleLocationPermission(context);
    if (!hasPermission) return null;

    Geolocator.getPositionStream(
            locationSettings: const LocationSettings(distanceFilter: 100))
        .listen((event) {
      UserService.updateUserLocation(event.latitude, event.longitude);
    });
  }
}
