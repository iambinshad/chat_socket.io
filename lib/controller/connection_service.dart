import 'dart:developer';

import 'package:chatapp_with_socket_io/core/api_config.dart';
import 'package:dio/dio.dart';

class UserConnectionService {
  Dio dio = Dio();
  static const currentUser = '6416b6c713f833c7ac1c938a';
  static const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MTZiNmM3MTNmODMzYzdhYzFjOTM4YSIsImlhdCI6MTY4NDI0NzgwNSwiZXhwIjoxNjg1MTExODA1fQ.eflLczegrEkyRmAt749kNob-OOwLGKAVlBCa_OP_f6A';

  Future<void> userConnection() async {
    String path = ApiConfigration.kBaseUrl +
        ApiConfigration.getUserConnections +
        currentUser;

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Beared $token"}));
      if (response.statusCode == 200) {
        log(response.toString(),name: "user");
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
  }
}

class VendorConnectionService {
  Dio dio = Dio();
  static const currentVendor = "64424ca620382fbc64a6f73e";
  static const token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NDI0Y2E2MjAzODJmYmM2NGE2ZjczZSIsImlhdCI6MTY4NDI0NjU4OCwiZXhwIjoxNjg1MTEwNTg4fQ.9wUhq7WkoXdORHxg7ckRZoui1wNODEGtb_SKkRulSeI";

  Future<void> vendorConnection() async {
    String path = ApiConfigration.kBaseUrl +
        ApiConfigration.getVendorConnections +
        currentVendor;

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Beared $token"}));
      if (response.statusCode == 200) {
        log(response.toString(),name: "vendor");
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
  }
}



