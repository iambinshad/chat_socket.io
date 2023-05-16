
import 'package:chatapp_with_socket_io/controller/connection_service.dart';
import 'package:flutter/material.dart';

class GetVendorConnections with ChangeNotifier{

  Future<void>fetchVendorConnections()async{

    VendorConnectionService().vendorConnection();
  }

}