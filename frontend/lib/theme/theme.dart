import 'package:flutter/material.dart';
import 'package:leet_board/theme/app_colors.dart';
import 'package:leet_board/theme/text_styles.dart';

class AppTheme extends ChangeNotifier {
  final ThemeData _darkTheme = ThemeData(
      backgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.primaryColor,
      splashColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.secondaryColor),
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: AppTextStyles.h1,
        headline2: AppTextStyles.h2,
        headline3: AppTextStyles.h3,
        headline4: AppTextStyles.h4,
        headline5: AppTextStyles.h5,
        headline6: AppTextStyles.h6,
        bodyText1: AppTextStyles.p1,
        bodyText2: AppTextStyles.p2,
      ),
      textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColors.greyTextColor,
          cursorColor: AppColors.secondaryColor));

  final ThemeData _lightTheme = ThemeData(
      backgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.secondaryColor),
      scaffoldBackgroundColor: AppColors.textColor,
      // brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: AppTextStyles.h1.copyWith(color: AppColors.secondaryColor),
        headline2: AppTextStyles.h2,
        headline3: AppTextStyles.h3,
        headline4: AppTextStyles.h4,
        headline5: AppTextStyles.h5,
        headline6: AppTextStyles.h6,
        bodyText1: AppTextStyles.p1,
        bodyText2: AppTextStyles.p3,
      ),
      textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColors.secondaryColor,
          cursorColor: AppColors.secondaryColor));

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;
}
