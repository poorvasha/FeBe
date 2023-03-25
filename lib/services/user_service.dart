import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

  static Future<void> updateUser(User user) async {
    var url = ApiRoutes.userBase;
    try {
      var payload = json.encode(user.toJson());
      await HttpClient.put(url, payload);
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }
}
