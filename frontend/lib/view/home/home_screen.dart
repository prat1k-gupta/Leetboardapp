import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/constants/app_strings.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/provider/home_page_provider.dart';
import 'package:leet_board/repositories/shared_preference.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/theme/app_colors.dart';
import 'package:leet_board/widgets/app_header.dart';
import 'package:leet_board/widgets/customLoadingScreen.dart';
import 'package:leet_board/widgets/easy_medium.dart';
import 'package:leet_board/widgets/group_name.dart';
import 'package:leet_board/widgets/rank_user.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.roomId});
  final String roomId;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SharedPreferenceRepo sharedPreferenceRepo = SharedPreferenceRepo();

  @override
  void initState() {
    Provider.of<HomePageProvider>(context, listen: false)
        .getUserData(widget.roomId);
    super.initState();
  }

  Future getData() async {
    final data = await sharedPreferenceRepo
        .getStringDataFromSharedPreference("userName");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final userData = Provider.of<HomePageProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();

        return false;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                log("???????????");
                //log(userData.usersModel.users![0].data.toString());
                log("???????????");

                if (userData.isLoading == true) {
                  return const Center(
                    child: CustomLoadingScreen(),
                  );
                } else {
                  log(userData.usersModel.roomName.toString());
                  return ListView(
                    children: [
                      vSizedBox1,
                      const AppHeader(
                        isShow: true,
                        isShowBack: false,
                      ),
                      vSizedBox1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RankUser(
                            image: userData.usersModel.users![1].data!
                                .matchedUser!.profile!.userAvatar
                                .toString(),
                            name: userData.usersModel.users![1].data!
                                .matchedUser!.profile!.realName
                                .toString(),
                            onPressed: () {
                              GoRouter.of(context).push(
                                  AppRouteNames.profileScreen,
                                  extra: userData.usersModel.users![1].data);
                            },
                            rank: "2nd",
                            height: 0,
                          ),
                          RankUser(
                            image: userData.usersModel.users![0].data!
                                .matchedUser!.profile!.userAvatar
                                .toString(),
                            name: userData.usersModel.users![0].data!
                                .matchedUser!.profile!.realName
                                .toString(),
                            onPressed: () {
                              GoRouter.of(context).push(
                                  AppRouteNames.profileScreen,
                                  extra: userData.usersModel.users![0].data);
                            },
                            rank: "1st",
                            height: 8.h,
                          ),
                          RankUser(
                            image: userData.usersModel.users![2].data!
                                .matchedUser!.profile!.userAvatar
                                .toString(),
                            name: userData.usersModel.users![2].data!
                                .matchedUser!.profile!.realName
                                .toString(),
                            onPressed: () {
                              GoRouter.of(context).push(
                                  AppRouteNames.profileScreen,
                                  extra: userData.usersModel.users![2].data);
                            },
                            rank: "2nd",
                            height: 0,
                          ),
                        ],
                      ),
                      GroupName(label: userData.usersModel.roomName.toString()),
                      vSizedBox2,
                      Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Text(AppStrings.appName,
                            style: theme.textTheme.bodyText2),
                      ),
                      vSizedBox2,
                      // List starts from here
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: userData.usersModel.users!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                            child: InkWell(
                              onTap: () {
                                GoRouter.of(context).push(
                                    AppRouteNames.profileScreen,
                                    extra:
                                        userData.usersModel.users![index].data);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 7.w, right: 7.w),
                                child: Container(
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkbrownColor,
                                    border:
                                        Border.all(color: theme.primaryColor),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        hSizedBox2,
                                        Container(
                                          height: 20.h,
                                          width: 13.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          userData
                                                              .usersModel
                                                              .users![index]
                                                              .data!
                                                              .matchedUser!
                                                              .profile!
                                                              .userAvatar
                                                              .toString())),
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                        ),
                                        hSizedBox2,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${index + 1}",
                                              style: theme.textTheme.bodyText1,
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              userData
                                                  .usersModel
                                                  .users![index]
                                                  .data!
                                                  .matchedUser!
                                                  .profile!
                                                  .realName
                                                  .toString(),
                                              style: theme.textTheme.bodyText1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              userData.usersModel.users![index]
                                                  .data!.matchedUser!.username
                                                  .toString(),
                                              style: theme.textTheme.bodyText1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        //easy
                                        const Spacer(),
                                        EasyMediumHard(
                                            number: userData
                                                .usersModel
                                                .users![index]
                                                .data!
                                                .matchedUser!
                                                .submitStatsGlobal!
                                                .acSubmissionNum![1]
                                                .count
                                                .toString(),
                                            type: "Easy"),
                                        // medium

                                        const Spacer(),
                                        EasyMediumHard(
                                            number: userData
                                                .usersModel
                                                .users![index]
                                                .data!
                                                .matchedUser!
                                                .submitStatsGlobal!
                                                .acSubmissionNum![2]
                                                .count
                                                .toString(),
                                            type: "Medium"),

                                        // hard
                                        const Spacer(),
                                        EasyMediumHard(
                                            number: userData
                                                .usersModel
                                                .users![index]
                                                .data!
                                                .matchedUser!
                                                .submitStatsGlobal!
                                                .acSubmissionNum![3]
                                                .count
                                                .toString(),
                                            type: "Hard"),
                                        const Spacer(),
                                      ]),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  );
                }
              },
            )),
      ),
    );
  }
}
