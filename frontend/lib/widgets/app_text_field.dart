import 'package:flutter/material.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.hintText});

  final TextEditingController controller;

  final String hintText;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        vSizedBox1,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.2.w),
              child: Text(
                labelText,
                style: theme.textTheme.bodyText2!
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        vSizedBox1,
        Padding(
          padding: EdgeInsets.only(left: 14.w, right: 14.w),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: theme.primaryColor, width: 1)),
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              cursorColor: theme.primaryColor,
              style: const TextStyle(color: AppColors.whiteColor),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 4.w),
                  hintText: hintText,
                  hintStyle: theme.textTheme.bodyText1!.copyWith(
                    color: AppColors.greyTextColor,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
