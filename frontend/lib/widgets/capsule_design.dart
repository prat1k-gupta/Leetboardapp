import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CapsuleDesign extends StatelessWidget {
  const CapsuleDesign({super.key,required this.rankNumber});
final String rankNumber;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 5.h,
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20)),
              border: Border.all(color: theme.primaryColor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Rank",
                style: theme.textTheme.bodyText1!.copyWith(fontSize: 12.sp)),
          ),
        ),
        const SizedBox(
          width: 1.7,
        ),
        Container(
          alignment: Alignment.center,
          height: 5.h,
          width: 12.w,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20)),
              border: Border.all(color: theme.primaryColor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(rankNumber,
                style: theme.textTheme.bodyText1!.copyWith(fontSize: 12.sp)),
          ),
        ),
      ],
    );
  }
}
