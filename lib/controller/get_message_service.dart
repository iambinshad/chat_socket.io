import 'dart:convert';
import 'dart:developer';

import 'package:chatapp_with_socket_io/controller/send_message_service.dart';
import 'package:chatapp_with_socket_io/core/api_config.dart';
import 'package:chatapp_with_socket_io/model/get_messages_model.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter/material.dart';

class FetchMessageService with ChangeNotifier {
  List<MessageResponse> messages = [];
  MessageResponse? messageResponseV;
  MessageResponse? messageResponseU;

  Dio dio = Dio();
  // static const currentUser = '6416b6c713f833c7ac1c938a';
  // static const token =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MTZiNmM3MTNmODMzYzdhYzFjOTM4YSIsImlhdCI6MTY4NDI0NzgwNSwiZXhwIjoxNjg1MTExODA1fQ.eflLczegrEkyRmAt749kNob-OOwLGKAVlBCa_OP_f6A';

  void reloadscreen() {
    notifyListeners();
    log("realoaded");
  }
// Stream<List<MessageResponse>>? get messageStream {
//   if (messageResponseV != null || messageResponseU != null) {
//     final messages = messageResponseV?.messages ?? messageResponseU?.messages;
//     return Stream.value<List<MessageResponse>>(messages ?? []);
//   }
//   return null;
// }
  Future<void> getMessagesOfVendor(
      String from, String? to, String? roll) async {

    String vendorPath =
        "http://10.4.4.2:3500/getMessage/64424ca620382fbc64a6f73e/6416b6c713f833c7ac1c938a";
    try {
      log("inside getmessage");
      Response response = await dio.get(vendorPath);
      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        messageResponseV = MessageResponse.fromJson(jsonResponse);
        notifyListeners();
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
  }

  Future<void> getMessagesOfUser(String from, String to, String roll) async {
    // String userPath =
    //     ApiConfigration.kBaseUrl + ApiConfigration.getMessages + from + to;

    // String vendorPath = ApiConfigration.kBaseUrl+vendor+ApiConfigration.getMessages+from+to;
    String userPath =
        "http://10.4.4.2:3500/getMessage/6416b6c713f833c7ac1c938a/64424ca620382fbc64a6f73e";
    try {
      log("inside getmessage");
      Response response = await dio.get(userPath);
      if (response.statusCode == 200) {
        notifyListeners();
        var jsonResponse = response.data;
        messageResponseU = MessageResponse.fromJson(jsonResponse);
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
  }

  void updateMessage(MessageResponse message) {
    log("inside updateMessage");
    MessageResponse messageResponse =
        MessageResponse(messages: message.messages);
    messageResponseV!.messages.add(messageResponse as Message);
    notifyListeners();
  }
}
