import 'package:erp/core/themes/app_colors.dart';
import 'package:erp/core/themes/text_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  primaryColor: AppColors.primaryColor800,
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor800,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black87,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: Styles.contentEmphasis.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: AppColors.neutralColor1600,
      size: 22.sp,
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 2,
    margin: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 8.sp),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.sp),
    ),
    shadowColor: Colors.black12,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor800,
      foregroundColor: Colors.white,
      elevation: 1,
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: Styles.contentEmphasis.copyWith(
      color: Colors.black87,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: Styles.contentEmphasis.copyWith(
      color: Colors.grey.shade700,
      fontSize: 14.sp,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    ),
  ),
  dividerColor: Colors.grey.shade200,
  listTileTheme: ListTileThemeData(
    tileColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.sp),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.primaryColor800,
    unselectedItemColor: Colors.grey.shade500,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
);
