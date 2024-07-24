import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';

class AppTheme{

  static getTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade100,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        primary: flamingo,
    ),
    useMaterial3: true,
  );

  /*static getTheme() => ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme(
      primary: flamingo,
      secondary: lightening_yellow,
      onPrimary: BrutColors.blackBrown,
      onSecondary: BrutColors.blackBrown,
      surface: BrutColors.smokyWhite,
      onSurface: BrutColors.blackBrown,
      error: BrutColors.primaryRed,
      onError: BrutColors.blackBrown,
      brightness: Brightness.light,
      shadow: BrutColors.blackBrown,
      outline: BrutColors.blackBrown,
      surfaceTint: BrutColors.smokyWhiteSecondary,
      background: BrutColors.smokyWhite,
      onBackground:  BrutColors.blackBrown,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: BrutColors.blackBrown,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: BrutColors.blackBrown,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: BrutColors.blackBrown,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: BrutColors.blackBrown,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: BrutColors.blackBrown,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: BrutColors.blackBrown,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: BrutColors.blackBrown,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: BrutColors.blackBrown,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: BrutColors.blackBrown,
      ),
    ),
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    primaryColor: BrutColors.blackBrown,
    appBarTheme: const AppBarTheme(
      backgroundColor: BrutColors.smokyWhite,
      foregroundColor: BrutColors.blackBrown,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: BrutColors.blackBrown,
      ),
      iconTheme: IconThemeData(
        color: BrutColors.blackBrown,
      ),
    ),

  );*/
}