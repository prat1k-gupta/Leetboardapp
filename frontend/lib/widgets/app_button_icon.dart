import 'package:flutter/material.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:sizer/sizer.dart';

import 'light_button.dart';

class AppButtonIcon extends StatelessWidget {
  const AppButtonIcon(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.iconOnpressed,
      required this.icon});
  final VoidCallback onPressed;
  final VoidCallback iconOnpressed;
  final String label;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14.w, right: 0.w),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: 72.w,
              alignment: Alignment.center,
              height: 6.h,
              decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  border: Border.all(color: theme.primaryColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                label,
                style: theme.textTheme.bodyText2!
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
              // color: AppColors.primaryColor,
            ),
          ),
        ),
        hSizedBox3,
        GestureDetector(
          onTap: iconOnpressed,
          child: Container(
              padding: const EdgeInsets.all(5.5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: theme.primaryColor),
              child: icon),
        )
      ],
    );
  }
}
