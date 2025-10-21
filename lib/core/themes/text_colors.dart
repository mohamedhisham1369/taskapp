import 'package:erp/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle getLocalizedTextStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.neutralColor1600,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    ));
  }

  static TextStyle display1 =
      getLocalizedTextStyle(fontSize: 44, fontWeight: FontWeight.bold);
  static TextStyle display2 =
      getLocalizedTextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  static TextStyle display3 =
      getLocalizedTextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle heading1 =
      getLocalizedTextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  static TextStyle heading2 =
      getLocalizedTextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle heading3 =
      getLocalizedTextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle heading4 =
      getLocalizedTextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle heading5 =
      getLocalizedTextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle featureBold = getLocalizedTextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2);
  static TextStyle featureEmphasis =
      getLocalizedTextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle featureStandard =
      getLocalizedTextStyle(fontSize: 18, fontWeight: FontWeight.normal);
  static TextStyle highlightBold =
      getLocalizedTextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle highlightEmphasis =
      getLocalizedTextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle highlightStandard =
      getLocalizedTextStyle(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle contentBold =
      getLocalizedTextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle contentEmphasis =
      getLocalizedTextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle contentRegular =
      getLocalizedTextStyle(fontSize: 14, fontWeight: FontWeight.normal);

  static TextStyle captionBold =
      getLocalizedTextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static TextStyle captionEmphasis =
      getLocalizedTextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle captionRegular =
      getLocalizedTextStyle(fontSize: 12, fontWeight: FontWeight.normal);

  static TextStyle footnoteAccent =
      getLocalizedTextStyle(fontSize: 10, fontWeight: FontWeight.bold);
  static TextStyle footnoteEmphasis =
      getLocalizedTextStyle(fontSize: 10, fontWeight: FontWeight.w600);
  static TextStyle footnoteRegular =
      getLocalizedTextStyle(fontSize: 10, fontWeight: FontWeight.normal);
}
