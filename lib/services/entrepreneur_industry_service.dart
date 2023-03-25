import 'dart:async';
import 'dart:io';

import 'package:febe_frontend/models/data/entrepreneur_industry.dart';

import '../configs/api_routes.dart';
import '../utils/app_exception.dart';
import '../utils/http_client.dart';

class EntrepreneurIndustryService {
  static Future<List<EntrepreneurIndustry>> getIndustries() async {
    var url = ApiRoutes.entrepreneurIndustryBase;
    try {
      var response = await HttpClient.get(url, isAuthenticationRequired: true);
      return (response as List).map((dynamic item) {
        return EntrepreneurIndustry.fromJson(item);
      }).toList();
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }
}
