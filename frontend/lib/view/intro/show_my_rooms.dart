import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/constants/app_images.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/provider/show_rooms.provider.dart';
import 'package:leet_board/repositories/shared_preference.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/widgets/app_header.dart';
import 'package:leet_board/widgets/customLoadingScreen.dart';
import 'package:leet_board/widgets/dark_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class ShowMyRooms extends StatefulWidget {
  const ShowMyRooms({super.key});

  @override
  State<ShowMyRooms> createState() => _ShowMyRoomsState();
}

class _ShowMyRoomsState extends State<ShowMyRooms> {
  final SharedPreferenceRepo sharedPreferenceRepo = SharedPreferenceRepo();

  String? finaldata = "";

  Future getData() async {
    final String? data = await sharedPreferenceRepo
        .getStringDataFromSharedPreference("userName");
    Future.delayed(const Duration(microseconds: 2), () {
      Provider.of<ShowRoomsProvider>(context, listen: false)
          .getRooms(data.toString());
      print("showMyScreen:$finaldata");
    });
  }

  @override
  void initState() {
    getData();

    print("showMyrooms:$finaldata");

    super.initState();
  }

  final _random = Random();
  List<String> images = [
    "https://cdn.discordapp.com/attachments/1018129102277976067/1027847666501177344/unknown.png",
    "https://cdn.discordapp.com/attachments/1018129102277976067/1027847819148664863/unknown.png"
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roomData = Provider.of<ShowRoomsProvider>(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Consumer<ShowRoomsProvider>(
            builder: (context, showRoomsProvider, child) {
              if (roomData.isLoading == true) {
                return const CustomLoadingScreen();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const AppHeader(
                        isShow: false,
                        isShowBack: true,
                      ),
                      vSizedBox2,
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 12.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.darkbrownColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: theme.primaryColor)),
                          child: TextField(
                            style: theme.textTheme.bodyText1,
                            decoration: InputDecoration(
                                hintText: "Search Your Rooms",
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      color: AppColors.whiteColor,
                                    )),
                                hintStyle: theme.textTheme.bodyText1),
                          ),
                        ),
                      ),
                      vSizedBox2,
                      // roomData.roomModel.roomIds == null
                      // ? const Center(
                      //     child: CustomLoadingScreen(),
                      //   )
                      // :
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: roomData.roomModel.roomIds!.length,
                        itemBuilder: (context, index) {
                          var imageToShow =
                              images[_random.nextInt(images.length)];
                          return GestureDetector(
                            onTap: () async {
                              final roomId = await sharedPreferenceRepo
                                  .getStringDataFromSharedPreference(
                                      "isRoomId");
                              GoRouter.of(context).push(
                                  AppRouteNames.homeScreen,
                                  extra: roomId);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  hSizedBox2,
                                  Container(
                                    height: 10.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                              imageToShow.toString(),
                                            ))),
                                  ),
                                  hSizedBox5,
                                  Text(
                                    roomData.roomModel.roomIds![index].roomName
                                        .toString(),
                                    style: theme.textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // Image.asset(
                      //   AppImages.adduserpng,
                      //   height: 20.h,
                      // ),
                      // vSizedBox1,
                      // Text(
                      //   "REBELS",
                      //   style: theme.textTheme.bodyText2,
                      // ),
                      vSizedBox2,
                      DarkButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouteNames.createUidAndJoin);
                          },
                          label: "CREATE ROOM")
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
