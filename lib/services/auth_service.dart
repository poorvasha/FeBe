import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:febe_frontend/configs/api_routes.dart';
import 'package:febe_frontend/utils/http_client.dart';

import '../utils/app_exception.dart';

class AuthService {
  static sendOTP(String phonenumber, String type) async {
    var url = ApiRoutes.authLogin;
    try {
      var payload = json.encode({'phonenumber': phonenumber, 'type': type});
      var response =
          await HttpClient.post(url, payload, isAuthenticationRequired: false);
      return response;
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }

  static verifyOTP(String phonenumber, String otp) async {
    var url = ApiRoutes.authVerifyOTP;
    try {
      var payload = json.encode({'phonenumber': phonenumber, 'otp': otp});
      var response = await HttpClient.post(url, payload);
      return response;
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }
}
