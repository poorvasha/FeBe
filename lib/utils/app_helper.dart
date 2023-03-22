import 'package:febe_frontend/configs/constants.dart';
import 'package:febe_frontend/models/misc/local_storage_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/secure_local_storage.dart';

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
}
