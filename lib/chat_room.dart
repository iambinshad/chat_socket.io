import 'dart:developer';
import 'package:chatapp_with_socket_io/core/api_config.dart';
import 'package:chatapp_with_socket_io/model/get_messages_model.dart';
import 'package:chatapp_with_socket_io/user_message.dart';
import 'package:chatapp_with_socket_io/widget.dart';
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
  String? chatId;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  late IO.Socket socket;

  List<MessagesModel>? msgs = [];

  void connectToServer() {
    socket = IO.io(ApiConfigration.kBaseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    if (!socket.connected) {
      log("done");
    }
    socket.on('connect', (_) {
      print('Connected');
    });

    socket.on('disconnect', (_) {
      print('Disconnected');
    });

    socket.on('error', (data) {
      print('Error: $data');
    });

    // Connect to the server
  }
  // @override
  // void initState() {

  //   super.initState();
  // }
  // @override
  // void initState() {

  //   super.initState();
  // }
// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
// @override
//   void didChangeDependencies() {

//     super.didChangeDependencies();
//   }
// @override
//   void initState() {
// super.initState();
// initSocket();
//   }
  // @override
  // void initState() {
  //   super.initState();
  //   connectToServer();
  // }
  @override
  void initState() {
    super.initState();
    socket = IO.io(ApiConfigration.kBaseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
// connectToServer();
if(socket.connected){
  log("conected");
}
      if (socket.disconnected) {
        initSocket();
      }
    });
    return Scaffold(
      bottomNavigationBar: const MyTextFormField(
        suffixIcon: Icon(Icons.send),
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
              CircleAvatar(),
              Text(widget.name!),
            ],
          )),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Check Your Internet Connection'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Expanded(
                flex: 10,
                child: ListView.builder(
                  reverse: true,
                  itemBuilder: (context, index) {
                    // Map<String, dynamic> map =
                    //     snapshot.data!.docs[index].data();
                    // return message(
                    //     model: map, context: context, currentId: '');
                  },
                  itemCount: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void initSocket() {
    log("inside initSocket");
    //-----connect to the socket id server----//

    // socket = IO.io(ApiConfigration.kBaseUrl, <String, dynamic>{
    //   'autoConnect': false,
    //   'transports': ['websocket'],
    // });
    socket.connect();
    if (socket.connected) {
      log("socket connected");
    }

    socket.emit("addUser", (widget.receiverId));
    setState(() {
      socket.on("msg-receive", (data) {
        MessagesModel model = MessagesModel(message: data, myself: false);
        msgs?.add(model);
      });
    });
    // setState(() {
    //   socket.on('msg-receive', (data) {
    //     return null;
    //   });
    // });
    // socket.onConnect((data) {
    //   // log("connection established...");
    //   socket.emit("addUser", ("64424ca620382fbc64a6f73e"));
    //   setState(() {
    //     socket.on(
    //         "send-msg", (data) => log(data.toString(), name: "get User"));
    //     socket.on("msg-receive", (data) {
    //       // log("received");
    //       // log(data.toString(), name: 'Data');

    //       // Provider.of<Chatprovider>(context, listen: false)
    //       //     .updateMessage(data["message"]);
    //     });
    //     // log('received..message', name: 'received');
    //   });
    // });
    socket.onDisconnect((_) => log("connection disconnected"));
    socket.onConnectError(
        (error) => log(error.toString(), name: "Socket in connection error"));
    socket.onError(
        (error) => log(error.toString(), name: "SOcket in another error"));
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }
}
