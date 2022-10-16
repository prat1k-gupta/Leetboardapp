import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/constants/app_images.dart';
import 'package:leet_board/repositories/shared_preference.dart';
import 'package:leet_board/routes/routes.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/widgets/dark_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferenceRepo sharedPreferenceRepo = SharedPreferenceRepo();
  @override
  void initState() {
    login();
    
    super.initState();
  }

  Future login() async {
    bool? value = await sharedPreferenceRepo
        .getBoolDatFromLocalSharedPreference("hasData");
    print(value);
    final roomId = await sharedPreferenceRepo
        .getStringDataFromSharedPreference("isRoomId");
    // if (value == true) {
    print(roomId);
    if (roomId != null) {
      print(roomId);
      Future.delayed(const Duration(seconds: 2), () {
        GoRouter.of(context)
            .push(AppRouteNames.homeScreen, extra: roomId.toString());
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        GoRouter.of(context)
            .push(AppRouteNames.choiceRoomScreen, extra: roomId.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset(AppImages.leetBoardLogo1))
              ])),
    );
  }
}
