import 'dart:async';
import 'dart:io';

import 'package:febe_frontend/models/data/enabler_category.dart';
import 'package:febe_frontend/models/data/enabler_designation.dart';

import '../configs/api_routes.dart';
import '../utils/app_exception.dart';
import '../utils/http_client.dart';

class EnablerCategoryService {
  static Future<List<EnablerCategory>> getCategories() async {
    var url = ApiRoutes.enablerCategoryBase;
    try {
      var response = await HttpClient.get(url, isAuthenticationRequired: true);
      return (response as List).map((dynamic item) {
        return EnablerCategory.fromJson(item);
      }).toList();
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }

  static Future<List<EnablerCategoryWithDesignation>>
      getCategoriesWithDesignations() async {
    var url = "${ApiRoutes.enablerCategoryBase}?shouldIncludeDesignations=true";
    try {
      var response = await HttpClient.get(url, isAuthenticationRequired: true);
      return (response as List).map((dynamic item) {
        return EnablerCategoryWithDesignation.fromJson(item);
      }).toList();
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }

  static Future<List<EnablerDesignation>> getDesignations(
      String categoryId) async {
    var url =
        ApiRoutes.enablerDesignation.replaceFirst("{categoryId}", categoryId);
    try {
      var response = await HttpClient.get(url, isAuthenticationRequired: true);
      return (response as List).map((dynamic item) {
        return EnablerDesignation.fromJson(item);
      }).toList();
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }
}
