import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/repositories/dio_client.dart';
import 'package:leet_board/repositories/shared_preference.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/widgets/toast.dart';

class CreateRoomProvider extends ChangeNotifier {
  final SharedPreferenceRepo sharedPreferenceRepo = SharedPreferenceRepo();

  DioClient dioClient = DioClient();
  
  List<String> usersData = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // UsersModel usersModel = UsersModel();

  Future createRoom(String groupName, String ownerId, String emailId,
      BuildContext context, String roomId, List<String> users) async {
    Map<String, dynamic> createRoomBody = {
      "avatar": "https://unsplash.com/photos/YKW0JjP7rlU",
      "roomName": groupName,
      "ownerEmail": emailId,
      "roomId": roomId,
      "ownerId": ownerId,
      "private": "false",
      "password": "12345",
      "users": users,
    };

    log(createRoomBody.toString());
    Response response;
    try {
      _isLoading = true;
      notifyListeners();

      response = await dioClient.sendRequest("createroom", createRoomBody);
      _isLoading = false;
      notifyListeners();
      if (response.statusCode == 200) {
        sharedPreferenceRepo.setStringDataInSharedPreference(
            "isRoomId", roomId);
        sharedPreferenceRepo.setStringDataInSharedPreference(
            "groupName", groupName);
        sharedPreferenceRepo.setStringDataInSharedPreference(
            "userName", ownerId);

        sharedPreferenceRepo.setBoolDataInSharedPreference("hasData", true);
        log("successfully saved");
        // ignore: use_build_context_synchronously
        GoRouter.of(context).push(AppRouteNames.homeScreen, extra: roomId);
        log(response.data.toString());
      } else {
        log(response.statusMessage.toString());
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future joinRoom(BuildContext context, String roomId, String username) async {
    Map<String, dynamic> rawBody = {
      "roomId": roomId,
      "userName": username,
      "password": "1234"
    };
    Response response;

    try {
      _isLoading = true;
      notifyListeners();
      response = await dioClient.sendRequest("joinroom", rawBody);
      _isLoading = false;
      notifyListeners();
      log(response.data["error"].toString());
      if (response.statusCode == 200) {
        if (response.data["error"]
            .toString()
            .contains("you are already in room")) {
          sharedPreferenceRepo.setStringDataInSharedPreference(
              "userName", username);
          sharedPreferenceRepo.setStringDataInSharedPreference(
              "isRoomId", roomId);
          // sharedPreferenceRepo.setStringDataInSharedPreference(
          //     "groupName", groupName);

          showToast(response.data["error"].toString());
          usersData.add(roomId);
          sharedPreferenceRepo.setStringListDataInSharedPreference(
              "RoomIdList", usersData);
          // ignore: use_build_context_synchronously
          GoRouter.of(context).push(AppRouteNames.homeScreen, extra: roomId);
        }
        sharedPreferenceRepo.setStringDataInSharedPreference(
            "userName", username);
        sharedPreferenceRepo.setStringListDataInSharedPreference(
            "RoomIdList", usersData);

        log(response.data);
        log(roomId);
        // ignore: use_build_context_synchronously
        GoRouter.of(context).push(AppRouteNames.homeScreen, extra: roomId);
        log("Successfully Joined the Room");
      } else {
        log(response.data);
        log(roomId);
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
