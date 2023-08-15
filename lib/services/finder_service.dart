import 'dart:async';
import 'dart:io';

import 'package:febe_frontend/models/data/user.dart';

import '../configs/api_routes.dart';
import '../utils/app_exception.dart';
import '../utils/http_client.dart';

class FinderService {
  static Future<List<User>> getNearbyUsers(
      double userLatitude,
      double userLongitude,
      int radius,
      String type,
      String userIdentity) async {
    var url = ApiRoutes.finderBase;

    final uri =
        Uri.http(ApiRoutes.baseUrl.replaceAll("https://", ""), "api/finder", {
      'latitude': userLatitude.toString(),
      'userIdentity': userIdentity.toString(),
      'longitude': userLongitude.toString(),
      'radius': radius.toString(),
      'type': type,
    });
    try {
      var response =
          await HttpClient.get(url, isAuthenticationRequired: true, uri: uri);
      return (response as List).map((dynamic item) {
        return User.fromJson(item);
      }).toList();
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }
}
