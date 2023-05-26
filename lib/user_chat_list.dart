import 'package:chatapp_with_socket_io/chat_room.dart';
import 'package:chatapp_with_socket_io/controller/connection_service.dart';
import 'package:chatapp_with_socket_io/vendor_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserChatListScreen extends StatelessWidget {
  const UserChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserConnectionService>(context,listen: false).userConnection();
    });
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text('User Messages', ),
      ),
      body: Column(
        children: [
          const ColoredBox(
            color: Color.fromARGB(255, 121, 216, 206),
            child: Padding(
                padding: EdgeInsets.only(right: 13, left: 13, bottom: 5),
                child:
                  CupertinoSearchTextField(
                    
                    backgroundColor: Colors.white,
                  ),
                )),
          
          Expanded(
            child:Consumer<UserConnectionService>(
              builder: (context, value, child) => 
               ListView.builder(
                 itemBuilder: (context, index) {
                   return Card(
                     child: ListTile(
                       onTap: () async {
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatRoom(name:value.sortedUsers![index].fullName ,receiverId:value.sortedUsers![index].id,role: "user"),));
                       },
                       leading:  value.sortedUsers![index].profilePhoto!.isEmpty
                         ? const CircleAvatar(backgroundImage: AssetImage(""))
                         : CircleAvatar(
                             backgroundImage: NetworkImage(
                                 value.sortedUsers![index].profilePhoto!),
                           ),
                       
                       title:  Text(value.sortedUsers![index].fullName!),
                       
                      //  trailing:value.connectionCount?[index].count!=null? CircleAvatar(
                      //    radius: 9,
                      //    child: Text(
                      //      '${value.connectionCount![index].count}',
                      //      style: const TextStyle(fontSize: 12),
                      //    ),
                      //  ):null
                     ),
                   );
                 },
                 itemCount:value.sortedUsers?.length,
               ),
            ),
            ),
          
        ],
      ),
    );
  }
}