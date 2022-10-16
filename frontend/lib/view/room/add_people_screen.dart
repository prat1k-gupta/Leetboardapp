import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/provider/create_room_provider.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/widgets/app_header.dart';
import 'package:leet_board/widgets/app_text_field.dart';
import 'package:leet_board/widgets/customLoadingScreen.dart';
import 'package:leet_board/widgets/dark_button.dart';
import 'package:leet_board/widgets/group_name.dart';
import 'package:leet_board/widgets/instruction.dart';
import 'package:leet_board/widgets/toast.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_images.dart';

class AddPeopleScreen extends StatelessWidget {
  const AddPeopleScreen(
      {super.key,
      required this.emailId,
      required this.groupName,
      required this.ownerId,
      required this.roomId});

  final String groupName;
  final String ownerId;
  final String emailId;
  final String roomId;
  @override
  Widget build(BuildContext context) {
    print(ownerId);
    List<String> addUsers = [];
    addUsers.add(ownerId);
    log(addUsers.toString());
    final theme = Theme.of(context);
    TextEditingController emailIdController = TextEditingController();
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: Consumer<CreateRoomProvider>(
              builder: (context, createRoomProvider, child) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(children: [
                        const AppHeader(
                          isShow: false,
                          isShowBack: true,
                        ),
                        Image.asset(
                          AppImages.adduserpng,
                          height: 22.h,
                          width: 100.w,
                        ),
                        vSizedBox1,
                        GroupName(label: groupName),
                        vSizedBox2,
                        Row(
                          children: [
                            const Spacer(),
                            Image.asset(
                              AppImages.roomIdText,
                            ),
                            const Spacer(),
                            Text(
                              roomId,
                              style: theme.textTheme.bodyText1,
                            ),
                            const Spacer()
                          ],
                        ),
                        vSizedBox3,
                        Center(
                          child: Image.asset(
                            AppImages.addUserText,
                          ),
                        ),
                        vSizedBox1,
                        AppTextField(
                            labelText: "ADD LEETCODE ID",
                            controller: emailIdController,
                            hintText: "LEETCODE USERNAME"),
                        vSizedBox3,
                        Row(
                          children: [
                            const Spacer(),
                            MaterialButton(
                              minWidth: 25.w,
                              height: 3.h,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                              onPressed: () {
                                addUsers.add(emailIdController.text);
                                emailIdController.clear();
                                showToast(
                                    "${emailIdController.text} Successfully added");
                                print(addUsers);
                              },
                              color: theme.primaryColor,
                              child: Text(
                                "ADD",
                                style: theme.textTheme.bodyText2!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const Spacer(),
                            MaterialButton(
                              minWidth: 25.w,
                              height: 3.h,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                              onPressed: () {
                                if (addUsers.length < 3) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Add Minimum 2 users',
                                        style: theme.textTheme.bodyText2,
                                      ),
                                    ),
                                  );
                                } else {
                                  createRoomProvider.createRoom(
                                      groupName,
                                      ownerId,
                                      emailId,
                                      context,
                                      roomId,
                                      addUsers);
                                }
                              },
                              color: theme.primaryColor,
                              child: Text(
                                "DONE",
                                style: theme.textTheme.bodyText2!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        vSizedBox2,
                        // const InstructionLabel()
                      ]),
                    ),
                    if (createRoomProvider.isLoading == true)
                      const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: CustomLoadingScreen(),
                      )
                  ],
                );
              },
            )));
  }
}
