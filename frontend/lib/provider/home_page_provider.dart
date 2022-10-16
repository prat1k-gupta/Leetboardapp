import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:leet_board/models/users_model.dart';
import 'package:leet_board/repositories/dio_client.dart';

class HomePageProvider extends ChangeNotifier {
  UsersModel usersModel = UsersModel();

  bool isLoading = false;

  DioClient dioClient = DioClient();

  Future<UsersModel> getUserData(String groupId) async {
    Response response;
    log("home page provider :$groupId");
    try {
      isLoading = true;
      response = await dioClient.getRequest("/rooms/$groupId");
      isLoading = false;

      if (response.statusCode == 200) {
        usersModel = UsersModel.fromJson(response.data);
        log("success");
      } else {
        log(response.statusCode.toString());
        log("There is Some Problem");
        isLoading = false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    notifyListeners();
    return usersModel;
  }
}
