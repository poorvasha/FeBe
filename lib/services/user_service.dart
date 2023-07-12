import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:febe_frontend/models/data/expanded_user.dart';
import 'package:febe_frontend/models/data/user.dart';

import '../configs/api_routes.dart';
import '../utils/app_exception.dart';
import '../utils/http_client.dart';

class UserService {
  static Future<User> getUser() async {
    var url = ApiRoutes.userBase;
    try {
      var response = await HttpClient.get(url);
      return User.fromJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }

  static Future<ExpandedUser> getExpandedUser() async {
    var url = "${ApiRoutes.userBase}?expand=true";
    try {
      var response = await HttpClient.get(url);
      return ExpandedUser.fromJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }

  static Future<void> updateUser(User user) async {
    var url = ApiRoutes.userBase;
    try {
      user.location = null;
      user.phoneNumber = null;
      user.isSignupCompleted = null;
      user.type = null;
      user.createdAt = null;
      user.updatedAt = null;

      var payload = json.encode(user.toJson());
      await HttpClient.put(url, payload);
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }

  static Future<void> updateUserLocation(
      double latitude, double longitude) async {
    String url = ApiRoutes.location;
    try {
      String payload =
          json.encode({'latitude': latitude, 'longitude': longitude});
      await HttpClient.put(url, payload);
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }
}
