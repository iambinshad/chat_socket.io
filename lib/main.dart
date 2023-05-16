import 'package:chatapp_with_socket_io/bottom_nav.dart';
import 'package:chatapp_with_socket_io/provider/get_vendor_connection.dart';
import 'package:chatapp_with_socket_io/vendor_chat_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/get_user_connections.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => GetUserConnections(),),
        ListenableProvider(create: (context) => GetVendorConnections(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
       
          primarySwatch: Colors.blue,
        ),
        home:  BottomNav(),
      ),
    );
  }
}
