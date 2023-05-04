import 'package:chatapp_with_socket_io/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Messages', ),
      ),
      body: Column(
        children: [
          ColoredBox(
            color: const Color.fromARGB(255, 121, 216, 206),
            child: Padding(
                padding: const EdgeInsets.only(right: 13, left: 13, bottom: 5),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(),));
                      },
                      leading:  const CircleAvatar(
                        
                      ),
                      
                      title: Text(''),
                      subtitle:  Text(""),
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