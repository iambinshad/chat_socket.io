import 'package:chatapp_with_socket_io/provider/get_vendor_connection.dart';
import 'package:chatapp_with_socket_io/vendor_message.dart';
import 'package:chatapp_with_socket_io/provider/get_user_connections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserChatListScreen extends StatelessWidget {
  const UserChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetUserConnections>(context,listen: false).fetchUserConnections();
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
            child:ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const VendorMessageScreen(),));
                      },
                      leading:  const CircleAvatar(
                        
                      ),
                      
                      title: const Text(''),
                      subtitle:  const Text(""),
                      trailing: Column(
                        children: [
                          const Text(
                            '10:40',
                          ),
                          CircleAvatar(
                            radius: 9,
                            child: Text(
                              '$index',
                              style: const TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount:5,
              ),
            ),
          
        ],
      ),
    );;
  }
}