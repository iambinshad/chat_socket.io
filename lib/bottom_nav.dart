import 'package:chatapp_with_socket_io/user_chat_list.dart';
import 'package:chatapp_with_socket_io/vendor_chat_list.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
   BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
List<Widget> screens= [
const VendorChatListScreen(),
const UserChatListScreen()
];

int currentIndex=0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:currentIndex ,
        onTap: (value) {
          setState(() {
            currentIndex= value;
          });
        },
        items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_rounded), label: "Vendor"),
        BottomNavigationBarItem(icon: Icon(Icons.man_2), label: "User"),
      ]),
      body:screens[currentIndex] ,
    );
  }
}
