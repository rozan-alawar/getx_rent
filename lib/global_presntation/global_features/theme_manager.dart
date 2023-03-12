// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';

import 'font_manager.dart';

class Themes {
  static final lightTheme = ThemeData(
    primaryColor: ColorManager.primary,
    accentColor: ColorManager.primary,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: ColorManager.white,
      secondary: ColorManager.primary,
    ),
    dividerColor: Colors.transparent,
    //-------------------- appBar theme -----------------------
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorManager.textColor,
      ),
      backgroundColor: ColorManager.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeightManager.bold,
        fontSize: 17.sp,
        fontFamily: FontConstants.arabicFontFamily,
        color: ColorManager.textColor,
      ),
      centerTitle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      toolbarHeight: 60.h,
    ),

    //-------------------- DropdownButtonFormField theme -----------------------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromRGBO(238, 241, 245, 1),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.w,
          color: ColorManager.borderColor,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.w,
          color: ColorManager.borderColor,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    //-------------------- ExpansionTile theme -----------------------
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: ColorManager.white,
      textColor: ColorManager.textColor,
    ),

    //-------------------- Stepper theme -----------------------
  );
}
