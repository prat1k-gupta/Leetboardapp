import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/constants/app_images.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/view/room/add_people_screen.dart';
import 'package:leet_board/widgets/app_button_icon.dart';
import 'package:leet_board/widgets/app_header.dart';
import 'package:leet_board/widgets/app_text_field.dart';
import 'package:leet_board/widgets/dark_button.dart';
import 'package:leet_board/widgets/instruction.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

class CreateUidJoin extends StatefulWidget {
  const CreateUidJoin({super.key});

  @override
  State<CreateUidJoin> createState() => _CreateUidJoinState();
}

class _CreateUidJoinState extends State<CreateUidJoin> {
  String roomId = "Generate Uid";
  @override
  Widget build(BuildContext context) {
    const uuid = Uuid();
    final theme = Theme.of(context);
    final TextEditingController groupNameController = TextEditingController();
    final TextEditingController ownerIdController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(children: [
            const AppHeader(
              isShow: false,
              isShowBack: true,
            ),
            Image.asset(
              AppImages.adduserpng,
              height: 22.h,
              // width: 100.w,
            ),
            vSizedBox1,
            Image.asset(AppImages.createNewRoom),
            vSizedBox3,
            AppTextField(
                labelText: "Room Name",
                controller: groupNameController,
                hintText: "Enter Room Name"),
            vSizedBox1,
            AppTextField(
                labelText: "Owner Leetcode Id",
                controller: ownerIdController,
                hintText: "Enter Owner Leetcode Id"),
            vSizedBox1,
            AppTextField(
                labelText: "EMAIL ID",
                controller: emailController,
                hintText: "Enter Email Id"),
            vSizedBox3,
            AppButtonIcon(
                onPressed: () {
                  roomId = uuid.v4();
                  Clipboard.setData(ClipboardData(text: roomId));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("$roomId copied to Clipboard"),
                    ),
                  );
                },
                label: "Generate RoomId",
                iconOnpressed: () async {
                  await Share.share(
                      "$roomId is your room id joined using the community using Leetboard MobileApplication",
                      subject: "LeetBoard RoomId");
                },
                icon: const Icon(Icons.share)),
            vSizedBox2,
            const InstructionLabel(),
            vSizedBox3,
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: DarkButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPeopleScreen(
                                emailId: emailController.text,
                                groupName: groupNameController.text,
                                ownerId: ownerIdController.text,
                                roomId: roomId)));
                  },
                  label: "Add People"),
            )
          ]),
        ),
      ),
    );
  }
}
