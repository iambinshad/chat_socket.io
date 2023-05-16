import 'package:chatapp_with_socket_io/controller/connection_service.dart';
import 'package:flutter/material.dart';

class GetUserConnections with ChangeNotifier{

  Future<void>fetchUserConnections()async{

    UserConnectionService().userConnection();
  }

}