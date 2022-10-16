import 'package:flutter/material.dart';
import 'package:leet_board/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class GroupName extends StatelessWidget {
  const GroupName({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(left: 18.w, right: 18.w),
      alignment: Alignment.center,
      height: 6.h,
      decoration: BoxDecoration(
          color: AppColors.darkbrownColor,
          border: Border.all(color: theme.primaryColor, width: 1.3),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        label,
        style: theme.textTheme.bodyText2!
            .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
      ),
    );
  }
}
