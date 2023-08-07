import 'package:chatapp_with_socket_io/chat_room.dart';
import 'package:chatapp_with_socket_io/controller/connection_service.dart';
import 'package:chatapp_with_socket_io/controller/get_message_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorChatListScreen extends StatelessWidget {
  const VendorChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VendorConnectionService>(context, listen: false)
          .vendorConnection();
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          'Vendor Messages',
        ),
      ),
      body: Column(
        children: [
          const ColoredBox(
              color: Color.fromARGB(255, 121, 216, 206),
              child: Padding(
                padding: EdgeInsets.only(right: 13, left: 13, bottom: 5),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.white,
                ),
              )),
          Expanded(
            child: Consumer<VendorConnectionService>(
              builder: (context, value, child) => ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        // String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NDI0Y2E2MjAzODJmYmM2NGE2ZjczZSIsImlhdCI6MTY4NDI0NjU4OCwiZXhwIjoxNjg1MTEwNTg4fQ.9wUhq7WkoXdORHxg7ckRZoui1wNODEGtb_SKkRulSeI";
                       FetchMessageService().getMessagesOfVendor("64424ca620382fbc64a6f73e", value.sortedVendors![index].id, "vendor");
                             Provider.of<FetchMessageService>(context,listen: false).getMessagesOfUser("6416b6c713f833c7ac1c938a","64424ca620382fbc64a6f73e", "user");

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  ChatRoom(name:value.sortedVendors![index].fullName,receiverId:value.sortedVendors![index].id,role:"vendor"),
                            ));
                      },
                      leading: value.sortedVendors![index].profilePhoto.isEmpty
                          ? const CircleAvatar(backgroundImage: AssetImage(""))
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                  value.sortedVendors![index].profilePhoto),
                            ),
                      title: Text(value.sortedVendors![index].fullName),
                    
                      trailing: const CircleAvatar(
                        radius: 9,
                        // child: Text(
                        //   '${value.connectionCount?[index].count}',
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                      ),
                    ),
                  );
                },
                itemCount: value.sortedVendors?.length,
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
