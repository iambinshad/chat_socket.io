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
      context.read<FetchMessageService>().getMessagesOfVendor("64424ca620382fbc64a6f73e","6416b6c713f833c7ac1c938a", "vendor");
      context.read<FetchMessageService>().getMessagesOfUser("6416b6c713f833c7ac1c938a","64424ca620382fbc64a6f73e", "user");
      Provider.of<UserConnectionService>(context, listen: false)
          .userConnection();
                     
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
