import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/provider/create_room_provider.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/theme/app_colors.dart';
import 'package:leet_board/widgets/app_header.dart';
import 'package:leet_board/widgets/app_text_field.dart';
import 'package:leet_board/widgets/customLoadingScreen.dart';
import 'package:leet_board/widgets/dark_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_images.dart';

class JoinRoom extends StatelessWidget {
  const JoinRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    TextEditingController roomIdController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Consumer<CreateRoomProvider>(
            builder: (context, createRoomProvider, child) {
              if (createRoomProvider.isLoading == true) {
                // const SizedBox(
                //   width: double.infinity,
                //   height: double.infinity,
                return const CustomLoadingScreen();
                // );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const AppHeader(
                        isShow: false,
                        isShowBack: true,
                      ),
                      vSizedBox2,
                      SvgPicture.asset(
                        AppImages.creatRoomVector,
                        height: 28.h,
                      ),
                      Image.asset(AppImages.joinNewRoomText),
                      vSizedBox2,
                      AppTextField(
                          labelText: "ROOM ID",
                          controller: roomIdController,
                          hintText: "Enter Room ID"),
                      vSizedBox2,
                      AppTextField(
                          labelText: "LEETCODE USERNAME",
                          controller: userNameController,
                          hintText: "Enter Leetcode Username"),
                      vSizedBox3,
                      Padding(
                        padding: EdgeInsets.only(left: 18.w, right: 18.w),
                        child: DarkButton(
                            onPressed: () {
                              createRoomProvider.joinRoom(
                                  context,
                                  roomIdController.text,
                                  userNameController.text);
                            },
                            label: "Join"),
                      )
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
