import 'package:chatapp_with_socket_io/widget.dart';
import 'package:flutter/material.dart';


class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 206, 158),
      appBar: AppBar(
        backgroundColor:Colors.red,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
             const CircleAvatar(
          
              radius: 23,
            ),
            const Text(
              ""
              
            )
          ],
        ),
      ),
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
               const Padding(
                        padding: EdgeInsets.all(8),
                        child: MyTextFormField(
                          prefixIcon: Icon(
                            Icons.tag_faces_outlined,
                            size: 28,
                          ),
                          hintText: 'message',
                          
                          
                        ),
                      )
            ],
          );
        },
      ),
    );;
  }
}