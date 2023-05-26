import 'dart:developer';

import 'package:chatapp_with_socket_io/core/api_config.dart';
import 'package:chatapp_with_socket_io/model/user_chat_list_model.dart';
import 'package:chatapp_with_socket_io/model/vendor_chat_list_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserConnectionService with ChangeNotifier {
  List<SortedUser>? sortedUsers;
  List<ConnectionCount>? connectionCount;
  Dio dio = Dio();
  static const currentUser = '6416b6c713f833c7ac1c938a';
  static const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MTZiNmM3MTNmODMzYzdhYzFjOTM4YSIsImlhdCI6MTY4NTExMzI2NywiZXhwIjoxNjg1OTc3MjY3fQ.cp0KhwV-iLCzwui5bX9-ya3bd2OkNeCfKGzp3Ple8YQ';

  Future<void> userConnection() async {
    String path = ApiConfigration.kBaseUrl +
        ApiConfigration.getUserConnections +
        currentUser;

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Beared $token"}));
      if (response.statusCode == 200) {
        notifyListeners();
        log(response.data.toString());
        Map<String, dynamic> responseData = response.data;
        var userChatListModel = UserChatListModel.fromJson(responseData);
        sortedUsers = userChatListModel.sortedUsers;
        connectionCount = userChatListModel.connectionCount;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
  }
}

class VendorConnectionService with ChangeNotifier {
  List<SortedVendor>? sortedVendors ;
  List<ConnectionCountV>? connectionCount;
  Dio dio = Dio();
  static const vendor = "/vendor";
  static const currentVendor = "64424ca620382fbc64a6f73e";
  static const token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NDI0Y2E2MjAzODJmYmM2NGE2ZjczZSIsImlhdCI6MTY4NTExMzQwMiwiZXhwIjoxNjg1OTc3NDAyfQ.tf3hYPrKpb6Q1SfBtrGree1A0RcaVsVfw-pi6AbWX0c";

  Future<VendorChatListModel?> vendorConnection() async {
    String path = ApiConfigration.kBaseUrl +
        vendor +
        ApiConfigration.getVendorConnections +
        currentVendor;

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Beared $token"}));
      if (response.statusCode == 200) {
         notifyListeners();
        log(response.data.toString());
        Map<String, dynamic> responseData = response.data;
        var vendorChatListModel = VendorChatListModel.fromJson(responseData);
        sortedVendors = vendorChatListModel.sortedUsers;
        connectionCount = vendorChatListModel.connectionCount;
      }
    } on DioError catch (e) {
      log(e.message.toString(), name: "Vendor error");
    }
    return null;
  }
}
