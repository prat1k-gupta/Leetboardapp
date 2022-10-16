import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/constants/app_images.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/widgets/dark_button.dart';
import 'package:leet_board/widgets/app_header.dart';
import 'package:leet_board/widgets/light_button.dart';

class ChoiceRoomScreen extends StatelessWidget {
  const ChoiceRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              vSizedBox2,
              const AppHeader(
                isShow: false,
                isShowBack: true,
              ),
              vSizedBox1,
              SvgPicture.asset(AppImages.creatRoomVector),
              vSizedBox1,
              Image.asset(AppImages.welcomeToLeetBoardPng),
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
          )
          ),
    );
  }
}
