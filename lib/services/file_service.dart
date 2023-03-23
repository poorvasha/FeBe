import 'dart:convert';

import 'package:febe_frontend/configs/api_routes.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/client_helper.dart';

class FileService {
  static upload(File imageFile) async {
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse(ApiRoutes.fileBase);

    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    request.headers.addAll(
        await ClientHelper.getClientHeader(authenticationRequired: true));

    request.files.add(multipartFile);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseJson = utf8.decode(responseData);
    return json.decode(responseJson);
  }
}
