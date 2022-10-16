import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/repositories/shared_preference.dart';
import 'package:leet_board/theme/app_colors.dart';
import 'package:leet_board/widgets/app_header.dart';
import 'package:leet_board/widgets/dark_button.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_images.dart';
import '../../routes/routes_names.dart';
import '../../widgets/light_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final SharedPreferenceRepo sharedPreferenceRepo = SharedPreferenceRepo();
  String data = "";
  String use = "";
  @override
  void initState() {
    getList();
    super.initState();
  }

  Future getList() async {
    final roomId = await sharedPreferenceRepo
        .getStringDataFromSharedPreference("isRoomId");
    print(roomId);
    final userName = await sharedPreferenceRepo
        .getStringDataFromSharedPreference("userName");
    log(userName.toString());
    setState(() {
      use = userName.toString();
      data = roomId.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          vSizedBox2,
          const AppHeader(
            isShow: false,
            isShowBack: true,
          ),
          vSizedBox1,

          SvgPicture.asset(AppImages.joinNewRoomVector),
          vSizedBox1,
          SizedBox(
            child: Column(
              children: [
                Text(use.toString()),
                SizedBox(
                    width: 60.w,
                    child: Text(
                      data.toString(),
                      overflow: TextOverflow.ellipsis,
                    )),
                vSizedBox3,
              ],
            ),
          ),
          // Image.asset(AppImages.welcomeToLeetBoardPng),
          vSizedBox3,
          DarkButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouteNames.createUidAndJoin);
              },
              label: "CREATE ROOM"),
          vSizedBox5,
          LightButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouteNames.joinRoomScreen);
              },
              label: "JOIN ROOM"),
          vSizedBox5,
          DarkButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouteNames.showMyRooms);
              },
              label: "SHOW MY ROOMS"),
          vSizedBox5,
          LightButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouteNames.showContest);
              },
              label: "UPCOMING CONTEST"),
        ],
      )),
    ));
  }
}
