import 'dart:developer';

import 'package:chatapp_with_socket_io/controller/get_message_service.dart';
import 'package:chatapp_with_socket_io/core/api_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketProvider with ChangeNotifier{
IO.Socket? socket;
void clearDispose(userId) {
    super.dispose();
    socket?.disconnect();
    socket?.emit('disconnect', userId);
  }
  void connect(recieverId,context) {
   socket = IO.io(ApiConfigration.kBaseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });

    socket?.connect();
   socket?.emit("addUser", recieverId);
   socket?.on("msg-receive", (data) {
      log(data,name: "not working log");

      Provider.of<FetchMessageService>(context,listen: true).updateMessage(data["message"]);

    });
  }
}

