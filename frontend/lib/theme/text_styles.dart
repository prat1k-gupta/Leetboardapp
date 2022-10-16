import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leet_board/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get display =>
      GoogleFonts.montserrat(fontSize: 40.sp, color: AppColors.textColor);

  // heading styles

  static TextStyle get h1 =>
      GoogleFonts.fjallaOne(fontSize: 60.sp, color: AppColors.textColor);

  static TextStyle get h1SemiBold =>
      GoogleFonts.kanit(fontSize: 60.sp, color: AppColors.textColor);
  static TextStyle get h2 => GoogleFonts.kanit(
        fontSize: 39.sp,
        color: AppColors.textColor,
      );
// here it is
  static TextStyle get h2SemiBold => GoogleFonts.kanit(
        fontSize: 39.sp,
        color: AppColors.textColor,
      );

  static TextStyle get h3 => GoogleFonts.kanit(
        fontSize: 33.sp,
        color: AppColors.textColor,
      );

  static TextStyle get h3SemiBold => GoogleFonts.kanit(
        fontSize: 33.sp,
        color: AppColors.textColor,
      );

  static TextStyle get h4 => GoogleFonts.kanit(
        fontSize: 28.sp,
        color: AppColors.textColor,
      );

  static TextStyle get h4SemiBold => GoogleFonts.kanit(
        fontSize: 28.sp,
        color: AppColors.textColor,
      );

  static TextStyle get h5 => GoogleFonts.kanit(
        fontSize: 23.sp,
        color: AppColors.textColor,
      );

  static TextStyle get h5SemiBold => GoogleFonts.kanit(
        fontSize: 23.sp,
        color: AppColors.textColor,
      );

  static TextStyle get h6 => GoogleFonts.kanit(
        fontSize: 19.sp,
        color: AppColors.textColor,
      );

  static TextStyle get h6SemiBold => GoogleFonts.kanit(
        fontSize: 19.sp,
        color: AppColors.textColor,
      );

  // Paragraphs styles
  static TextStyle get p1 => GoogleFonts.kanit(
        fontSize: 10.sp,
        color: AppColors.textColor,
      );

  static TextStyle get p1Bold => GoogleFonts.kanit(
        fontSize: 14.sp,
        color: AppColors.textColor,
      );

  static TextStyle get p2 => GoogleFonts.kanit(
        fontSize: 16.sp,
        color: AppColors.textColor,
      );

  static TextStyle get p2Bold => GoogleFonts.kanit(
        fontSize: 16.sp,
        color: AppColors.textColor,
      );
  static TextStyle get p3 => GoogleFonts.kanit(
        fontSize: 18.sp,
        color: AppColors.textColor,
      );

  static TextStyle get p3Bold => GoogleFonts.kanit(
        fontSize: 18.sp,
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
      );
}
