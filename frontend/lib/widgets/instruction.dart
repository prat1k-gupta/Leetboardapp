import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_strings.dart';
import '../theme/app_colors.dart';

class InstructionLabel extends StatelessWidget {
  const InstructionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      AppStrings.instruction,
      style: theme.textTheme.bodyText2!
          .copyWith(color: AppColors.greyTextColor, fontSize: 10.sp),
    );
  }
}
