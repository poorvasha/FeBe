import 'package:flutter/foundation.dart';

import '../services/secure_local_storage.dart';

class AppHelper {
  Future<bool> checkIsUserLoggedIn() async {
    try {
      var isContainsKey =
          await SecureStorage().containsKeyInSecureData('accesstoken');
      if (isContainsKey) {
        var data = await SecureStorage().readSecureData('accesstoken');
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

  Future<String> checkUserType() async {
    try {
      var isContainsKey =
          await SecureStorage().containsKeyInSecureData('userType');
      if (isContainsKey) {
        var data = await SecureStorage().readSecureData('userType');
        if (data != null && data.isNotEmpty) {
          return data;
        }
      }
      return "none";
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return "none";
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
}
