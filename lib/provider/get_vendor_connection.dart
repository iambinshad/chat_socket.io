import 'dart:developer';

import 'package:chatapp_with_socket_io/controller/connection_service.dart';
import 'package:chatapp_with_socket_io/model/vendor_chat_list_model.dart';
import 'package:flutter/material.dart';

class GetVendorConnections with ChangeNotifier {
  Future<void> fetchVendorConnections() async {
    Future<VendorChatListModel?> vendorChatListModel;

     VendorConnectionService().vendorConnection();
    
     
  }
}
