import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/widgets/capsule_design.dart';
import 'package:leet_board/widgets/profile_easy.dart';
import 'package:sizer/sizer.dart';
import '../../theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.listData});

  final listData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: ListView(
              shrinkWrap: true,
              children: [
                // Capsule Design4
                vSizedBox2,
                Row(
                  children: [
                    hSizedBox4,
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: theme.primaryColor,
                        size: 4.h,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    const CapsuleDesign(
                      rankNumber: "1",
                    ),
                    vSizedBox3,
                    // User Avatar
                    Container(
                      height: 12.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(listData
                                  .matchedUser!.profile!.userAvatar
                                  .toString())),
                          shape: BoxShape.circle),
                    ),
                    vSizedBox1,
                    Text(
                      listData!.matchedUser.profile!.realName,
                      style: theme.textTheme.bodyText1,
                    ),
                    vSizedBox1,
                    Text(
                      "Max Streak",
                      style: theme.textTheme.bodyText1,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${listData.matchedUser!.userCalendar.streak}",
                          style: theme.textTheme.bodyText1,
                        ),
                        hSizedBox2,
                        Image.asset(
                          "assets/images/fire.png",
                          height: 4.2.h,
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Column(
                          children: [
                            Text("Total Questions",
                                style: theme.textTheme.bodyText2),
                            Container(
                              alignment: Alignment.center,
                              height: 12.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: theme.primaryColor),
                                  color: AppColors.darkbrownColor,
                                  shape: BoxShape.circle),
                              child: Text(
                                  "${listData!.matchedUser.submitStatsGlobal!.acSubmissionNum![0].count}",
                                  style: theme.textTheme.bodyText1),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            vSizedBox1,
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                width: 55.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    boxShadow: const [],
                                    border:
                                        Border.all(color: theme.primaryColor),
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.darkbrownColor),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ProfileEasy(
                                          number:
                                              "${listData!.matchedUser.submitStatsGlobal!.acSubmissionNum![1].count}",
                                          type: "Easy"),

                                      // Medium
                                      ProfileEasy(
                                          number:
                                              "${listData!.matchedUser.submitStatsGlobal!.acSubmissionNum![2].count}",
                                          type: "Medium"),
                                      // hard
                                      ProfileEasy(
                                          number:
                                              "${listData!.matchedUser.submitStatsGlobal!.acSubmissionNum![3].count}",
                                          type: "Hard")
                                    ]),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Recent Questions",
                          style: theme.textTheme.bodyText1,
                        ),
                      ),
                    ),
                    vSizedBox2,
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listData.recentAcSubmissionList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              _launchURLBrowser(listData
                                  .recentAcSubmissionList[index].titleSlug);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: theme.primaryColor),
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColors.darkbrownColor),
                              child: Text(
                                "${listData.recentAcSubmissionList[index].title}",
                                // "${usersController.userList[index].data!.matchedUser.submitStatsGlobal!.acSubmissionNum![1].count}",
                                style: theme.textTheme.bodyText1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            )));
  }

  _launchURLBrowser(var code) async {
    var url = Uri.parse("https://leetcode.com/problems/$code/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
