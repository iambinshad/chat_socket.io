import 'package:chatapp_with_socket_io/bottom_nav.dart';
import 'package:chatapp_with_socket_io/controller/connection_service.dart';
import 'package:chatapp_with_socket_io/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => UserConnectionService(),),
        ListenableProvider(create: (context) => VendorConnectionService(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
       
          primarySwatch: Colors.blue,
        ),
        home:  SplashScreen(),
      ),
    );
  }
}
