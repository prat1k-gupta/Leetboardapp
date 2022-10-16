import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:leet_board/models/show_room_model.dart';
import 'package:leet_board/repositories/dio_client.dart';
import 'package:leet_board/repositories/shared_preference.dart';

class ShowRoomsProvider extends ChangeNotifier {
  ShowRoomModel roomModel = ShowRoomModel();

  bool isLoading = false;

  DioClient dioClient = DioClient();

  Future<ShowRoomModel> getRooms(String userName) async {
    final sharedPreferenceRepo = SharedPreferenceRepo();
    Response response;
    log(userName.toString());
    try {
      isLoading = true;
      response = await dioClient.getRequest("myrooms/$userName");
      isLoading = false;
      notifyListeners();
      if (response.statusCode == 200) {
        log("////////////////////////getrooms response////////");
        log(response.data.toString());

        roomModel = ShowRoomModel.fromJson(response.data);
        // sharedPreferenceRepo.setStringDataInSharedPreference("roomName", roomModel.);
        log("successfully fetched the pratik");
      } else {
        log(response.statusCode.toString());

        log("There is Some Problem");
        isLoading = false;
        notifyListeners();
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    notifyListeners();
    return roomModel;
  }
}
