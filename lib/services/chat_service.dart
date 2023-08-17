import 'dart:async';
import 'dart:io';

import 'package:febe_frontend/models/data/user.dart';

import '../configs/api_routes.dart';
import '../utils/app_exception.dart';
import '../utils/http_client.dart';

class ChatService {
  static Future<List<User>> getChats() async {
    var url = ApiRoutes.chatBase;

    try {
      var response =
          await HttpClient.get(url, isAuthenticationRequired: true);
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
