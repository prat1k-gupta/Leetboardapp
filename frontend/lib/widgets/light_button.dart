import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LightButton extends StatelessWidget {
  const LightButton(
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
      padding: EdgeInsets.only(left: 0.w, right: 0.w),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 40.h,
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
    );
  }
}
