import 'package:chatapp_with_socket_io/widget.dart';
import 'package:flutter/material.dart';

class VendorMessageScreen extends StatelessWidget {
  const VendorMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyTextFormField(suffixIcon: Icon(Icons.send),),
        backgroundColor: const Color.fromARGB(255, 223, 206, 158),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              // const CircleAvatar(
              //   backgroundImage: AssetImage('assets/works/profile pic.jpg'),
              //   radius: 23,
              // ),
              const SizedBox(
                width: 10,
              ),
              Text("")
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
                      return Container(
                        color: Colors.yellow,
                        child: Text("Nothing"),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
           
              ],
            );
          },
        ),);
  }
}
