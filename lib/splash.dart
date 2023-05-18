import 'package:chatapp_with_socket_io/bottom_nav.dart';
import 'package:chatapp_with_socket_io/controller/connection_service.dart';
import 'package:chatapp_with_socket_io/controller/get_message_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<UserConnectionService>(context, listen: false)
          .userConnection();
                                  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NDI0Y2E2MjAzODJmYmM2NGE2ZjczZSIsImlhdCI6MTY4NDI0NjU4OCwiZXhwIjoxNjg1MTEwNTg4fQ.9wUhq7WkoXdORHxg7ckRZoui1wNODEGtb_SKkRulSeI";

                       FetchMessageService().GetMessages("64424ca620382fbc64a6f73e/", "6416b6c713f833c7ac1c938a", token, "vendor");

      Provider.of<VendorConnectionService>(context, listen: false)
          .vendorConnection();
      await Future.delayed(const Duration(milliseconds: 5000));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(),
          ));
    });
    return const Scaffold(
      body: Center(
        child: Text("good app"),
      ),
    );
  }
}
