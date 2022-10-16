import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:leet_board/models/contest_model.dart';

class GetContestProvider extends ChangeNotifier {
  Dio _dio = Dio();
  bool _isLoading = false;
  ContestModel contestModel = ContestModel();
  bool get isLoading => _isLoading;

  Future<ContestModel> getUpcomingContest(String dateTime) async {
    Response response;

    try {
      _isLoading = true;
      response = await _dio.get(
          "https://clist.by/api/v2/contest/?username=prat1kgupta&api_key=65be0f63adc36f4b1d086d5370dcc8f9d6d8bd7c&limit=10&resource=codeforces.com%2Ccodechef.com%2Cleetcode.com&start__gt=$dateTime");
      _isLoading = false;

      if (response.statusCode == 200) {
        contestModel = ContestModel.fromJson(response.data);
        log(response.data.toString());
        log("success");
      } else {
        log(response.statusCode.toString());
        log("There is Some Problem");
        _isLoading = false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }

    notifyListeners();
    return contestModel;
  }
}
