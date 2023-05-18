import 'dart:convert';
import 'dart:developer';

import 'package:chatapp_with_socket_io/core/api_config.dart';
import 'package:chatapp_with_socket_io/model/get_messages_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FetchMessageService with ChangeNotifier{

List<MessagesModel> messages = [];

  Dio dio = Dio();
  // static const currentUser = '6416b6c713f833c7ac1c938a';
  // static const token =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MTZiNmM3MTNmODMzYzdhYzFjOTM4YSIsImlhdCI6MTY4NDI0NzgwNSwiZXhwIjoxNjg1MTExODA1fQ.eflLczegrEkyRmAt749kNob-OOwLGKAVlBCa_OP_f6A';

  Future<List<MessagesModel>?> GetMessages(String from , String to,String token,String roll) async {
    String userPath = ApiConfigration.kBaseUrl +
        ApiConfigration.getMessages +from+to;
        
        // String vendorPath = ApiConfigration.kBaseUrl+vendor+ApiConfigration.getMessages+from+to;
        String vendorPath ="http://10.4.4.127:3500/getMessage/64424ca620382fbc64a6f73e/6416b6c713f833c7ac1c938a";
    try {
      Response response = await dio.get(vendorPath,
          options: Options(headers: {"authorization": "Beared $token"}));
      if (response.statusCode == 200) {
    
  log(messages.toString(),);

      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}