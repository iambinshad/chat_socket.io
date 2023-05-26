import 'dart:developer';
import 'package:chatapp_with_socket_io/controller/get_message_service.dart';
import 'package:chatapp_with_socket_io/controller/send_message_service.dart';
import 'package:chatapp_with_socket_io/core/api_config.dart';
import 'package:chatapp_with_socket_io/message_tile.dart';
import 'package:chatapp_with_socket_io/provider/socket_provider.dart';
import 'package:chatapp_with_socket_io/widget.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom(
      {super.key,
      required this.role,
      required this.name,
      required this.receiverId});
  String? role;
  String? receiverId;
  String? name;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  // late IO.Socket socket;

  // @override
  // void initState() {
  //   super.initState();
  //   socket = IO.io(ApiConfigration.kBaseUrl, <String, dynamic>{
  //     'autoConnect': false,
  //     'transports': ['websocket'],
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final socketProvi = Provider.of<SocketProvider>(context,listen: false);
    socketProvi.connect(widget.receiverId, context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // if (socket.disconnected) {
      //   initSocket(context);
      // }
      if (!socketProvi.socket!.connected) {
        log("socket not connected");
      }
      if (socketProvi.socket!.disconnected) {
        log("disconnected");
      }
      if (socketProvi.socket!.connected) {
        log("connected");
      }
    });
    return Scaffold(
      bottomNavigationBar: MyTextFormField(
        controller: Provider.of<SendMessageService>(context, listen: false)
            .messageController,
        suffixIcon: IconButton(
            onPressed: () async {
              Provider.of<SendMessageService>(context, listen: false)
                  .sendMessageService(
                      widget.role == "vendor"
                          ? "64424ca620382fbc64a6f73e"
                          : "6416b6c713f833c7ac1c938a",
                      widget.receiverId,
                      widget.role);
              sendMessageSocket(
                  widget.role == "vendor"
                      ? "64424ca620382fbc64a6f73e"
                      : "6416b6c713f833c7ac1c938a",
                  widget.receiverId);
                 
            },
            icon: const Icon(Icons.send)),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 206, 158),
      appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              const CircleAvatar(),
              Text(widget.name!),
            ],
          )),
      body: Consumer<FetchMessageService>(
        builder: (context, messageService, _) {
          final messages = widget.role == "vendor"
              ? messageService.messageResponseV!.messages
              : messageService.messageResponseU!.messages;

          return ListView.builder(
            itemBuilder: (context, index) {
              final message = messages[index];
              return messageTile(
                text: message.message,
                context: context,
                myself: message.myself,
              );
            },
            itemCount: messages.length,
          );
        },
      ),
    );
  }

// void initSocket(context) {
//   log("inside initSocket");

//   // socket.on("msg-receive", (data) {
//   //   print(data.toString());
//   //   // log(data, name: "not working log");
//   //   Provider.of<FetchMessageService>(context, listen: false)
//   //       .updateMessage(data["message"]);
//   // });

//   socket.onDisconnect((_) => log("connection disconnected"));
//   socket.onConnectError(
//       (error) => log(error.toString(), name: "Socket connection error"));
//   socket.onError((error) => log(error.toString(), name: "Socket error"));

//   socket.connect();
//   socket.emit("addUser", widget.receiverId);
// }

  // void initSocket(context) {
  //   log("inside initSocket");
  //   socket.connect();
  //   socket.emit("addUser", widget.receiverId);
  //    socket.on("msg-receive", (data) {
  //     log(data,name: "not working log");

  //     Provider.of<FetchMessageService>(context,listen: true).updateMessage(data["message"]);

  //   });
 

  //   socket.onDisconnect((_) => log("connection disconnected"));
  //   socket.onConnectError(
  //       (error) => log(error.toString(), name: "Socket in connection error"));
  //   socket.onError(
  //       (error) => log(error.toString(), name: "SOcket in another error"));
  // }

  @override
  void dispose() {
    Provider.of<SocketProvider>(context,listen: false).socket!.disconnect();
    super.dispose();
  }

  void sendMessageSocket(String from, String? to) {
    Provider.of<SocketProvider>(context,listen: false).socket!.emit("send-msg", {
      "from": from,
      "to": to,
      "message": Provider.of<SendMessageService>(context, listen: false)
          .messageController
          .text
    });
  }
}
