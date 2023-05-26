import 'dart:convert';
import 'dart:developer';

import 'package:chatapp_with_socket_io/core/api_config.dart';
import 'package:chatapp_with_socket_io/model/send_message_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SendMessageService with ChangeNotifier {
  Dio dio = Dio();
  TextEditingController messageController = TextEditingController();

  Future<void> sendMessageService(
      String? roleId, String? senderId, String? role) async {

    String path = ApiConfigration.kBaseUrl + ApiConfigration.chat;
    if (messageController.text.isNotEmpty) {
      MessageModel messageModel =
          MessageModel(from: roleId, to: senderId, message: messageController.text);
      try {
        Response response = await dio.post(
           path ,
          data: jsonEncode(messageModel.tojson()));
          if (response.statusCode == 200) {
            notifyListeners();
        log(
          "Message Sending succussfull",
        );
      }
      }on DioError catch (e) {
        log(e.message.toString());
      }
      

      messageController.clear();
    }
  }
}
