import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DarkButton extends StatelessWidget {
  const DarkButton(
      {super.key,
      required this.onPressed,
      this.height,
      required this.label,
      this.padding,
      this.width});

  final String label;
  final VoidCallback onPressed;
  final double? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: MaterialButton(
        minWidth: 259.h,
        height: 6.h,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
        onPressed: onPressed,
        color: theme.primaryColor,
        child: Text(
          label,
          style: theme.textTheme.bodyText2!
              .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
