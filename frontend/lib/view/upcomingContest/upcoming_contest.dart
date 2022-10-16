import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leet_board/constants/app_images.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/provider/get_contest_provider.dart';
import 'package:leet_board/theme/app_colors.dart';
import 'package:leet_board/widgets/app_header.dart';
import 'package:leet_board/widgets/customLoadingScreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UpcomingContest extends StatefulWidget {
  const UpcomingContest({super.key});

  @override
  State<UpcomingContest> createState() => _UpcomingContestState();
}

class _UpcomingContestState extends State<UpcomingContest> {
  @override
  void initState() {
    String date = DateTime.now().toIso8601String();
    Provider.of<GetContestProvider>(context, listen: false)
        .getUpcomingContest(date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contestData = Provider.of<GetContestProvider>(context, listen: false);

    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Consumer<GetContestProvider>(
          builder: (context, getContestProvider, child) {
            if (getContestProvider.isLoading == true) {
              return const CustomLoadingScreen();
            } else {
              return ListView(
                // shrinkWrap: true,
                children: [
                  const AppHeader(
                    isShow: true,
                    isShowBack: true,
                  ),
                  vSizedBox2,
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    padding: EdgeInsets.only(
                        left: 9.w, right: 9.w, top: 0.5.h, bottom: 0.5.h),
                    decoration: BoxDecoration(
                        // color: AppColors.darkbrownColor,
                        border: Border.all(color: theme.primaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(
                      AppImages.allContest,
                    ),
                  ),
                  vSizedBox2,
                  Center(
                    child: Text(
                      "UPCOMING CONTESTS",
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                  vSizedBox3,
                  ListView.builder(
                    itemCount: contestData.contestModel.objects!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final time = DateTime.parse(contestData
                          .contestModel.objects![index].start
                          .toString());

                      final dateTime = DateFormat('d-MM-yyyy').format(time);
                      int timeonly = contestData
                          .contestModel.objects![index].duration as int;

                      int timeans = timeonly ~/ 360;
                      print(timeans);
                      // final timeans = DateFormat('m').format(timeonly);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            hSizedBox8,
                            Container(
                                width: 72.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: theme.primaryColor, width: 2)),
                                child: Row(children: [
                                  hSizedBox1,
                                  if (contestData.contestModel.objects![index]
                                          .resourceId ==
                                      1)
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(
                                              color: AppColors.primaryColor),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  "assets/images/code.png"))),
                                      width: 10.w,
                                      height: 6.h,
                                    )
                                  else if (contestData.contestModel
                                          .objects![index].resourceId ==
                                      2)
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: AppColors.primaryColor),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: AssetImage(
                                                  AppImages.codeChef))),
                                      width: 10.w,
                                      height: 6.h,
                                    )
                                  else
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: AppColors.primaryColor),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  AppImages.leetCode))),
                                      width: 40.w,
                                      height: 4.h,
                                    ),
                                  hSizedBox2,
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 32.w,
                                        child: Text(
                                          contestData.contestModel
                                              .objects![index].event
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodyText1,
                                        ),
                                      ),
                                      vSizedBox1,
                                      Text(
                                        contestData.contestModel.objects![index]
                                            .resource
                                            .toString(),
                                        style: theme.textTheme.bodyText1,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(children: [
                                    Text(
                                      dateTime,
                                      style: theme.textTheme.bodyText1,
                                    ),
                                    vSizedBox1,
                                    Text(
                                      "$timeans min",
                                      style: theme.textTheme.bodyText1,
                                    )
                                  ]),
                                  hSizedBox4,
                                ])),
                            hSizedBox4,
                            Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                  color: AppColors.darkbrownColor,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: theme.primaryColor)),
                              child: Icon(
                                Icons.notifications,
                                size: 3.h,
                                color: theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
