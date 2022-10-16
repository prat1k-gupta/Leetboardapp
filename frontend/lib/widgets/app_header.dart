import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:leet_board/routes/routes.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_images.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.isShow, required this.isShowBack});
  final bool isShow;
  final bool isShowBack;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 1.6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isShow == false ? hSizedBox3 : const SizedBox(),
          isShowBack == false
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: theme.primaryColor,
                    size: 4.h,
                  ),
                ),
          hSizedBox8,
          hSizedBox9,
          Image.asset(
            AppImages.leetBoardLogo1,
            height: 2.2.h,
          ),
          if (isShow == false)
            const Spacer()
          else if (isShow == true)
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouteNames.menuScreen);
              },
              child: Image.asset(
                AppImages.appMenu,
                height: 6.h,
              ),
            )
          else
            const SizedBox()
        ],
      ),
    );
  }
}
