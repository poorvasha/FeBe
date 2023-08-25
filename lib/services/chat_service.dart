import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:febe_frontend/models/data/user.dart';

import '../configs/api_routes.dart';
import '../models/data/all_chats_data_model.dart';
import '../models/data/chat_messages_data_model.dart';
import '../utils/app_exception.dart';
import '../utils/http_client.dart';

class ChatService {
  static Future<List<ChatsData>> getChats() async {
    var url = ApiRoutes.chatBase;

    try {
      var response = await HttpClient.get(url, isAuthenticationRequired: true);

      // if (response == []) {
      //   return [];
      // }

      return List.generate(response.length, (i) {
        return ChatsData.fromJson(response[i]);
      });
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }

  static Future<List<ExpandedChatMessage>> getMessages(String chatId) async {
    var url = ApiRoutes.chatMessage.replaceFirst("{chatId}", chatId);

    try {
      var response = await HttpClient.get(url, isAuthenticationRequired: true);
      return List.generate(response.length, (i) {
        return ExpandedChatMessage.fromJson(response[i]);
      });
      
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', url.toString());
    }
  }
}
