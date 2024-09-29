import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'strings_manager.dart';

import 'color_manager.dart';

ThemeData get appTheme => ThemeData(
      fontFamily: AppStrings.fontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: kMainColor,
        primary: kMainColor,
        brightness: Brightness.light,
        onPrimary: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.sp),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kMainColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.sp),
            ),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        elevation: 0.0,
      ),
    );
