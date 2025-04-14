import 'package:flutter/material.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    colorScheme: ColorScheme(
      brightness: ColorConstant.brightness,
      primary: ColorConstant.primaryColor,
      onPrimary: ColorConstant.onPrimaryColor,
      secondary: ColorConstant.secondaryColor,
      onSecondary: ColorConstant.onSecondaryColor,
      error: ColorConstant.errorColor,
      onError: ColorConstant.onErrorColor,
      surface: ColorConstant.surfaceColor,
      onSurface: ColorConstant.onSurfaceColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstant.primaryColor,
        foregroundColor: ColorConstant.onPrimaryColor,
        padding: EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: ColorConstant.onSurfaceColor),
      errorStyle: TextStyle(color: ColorConstant.errorColor),
      suffixIconColor: ColorConstant.onBacgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ColorConstant.primaryColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ColorConstant.errorColor,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ColorConstant.errorColor,
          width: 2,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstant.primaryColor,
      foregroundColor: ColorConstant.onPrimaryColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorConstant.surfaceColor,
      selectedItemColor: ColorConstant.primaryColor,
      unselectedItemColor: ColorConstant.onSurfaceColor.withAlpha(60),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
