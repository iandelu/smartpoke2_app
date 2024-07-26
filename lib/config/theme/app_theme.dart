import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';

class AppTheme{

  static getTheme() => ThemeData(
    scaffoldBackgroundColor: cream2,
    colorScheme: ColorScheme.fromSeed(
        seedColor: cream2,
        primary: accentTeal1,
    ),
    useMaterial3: true,
  );

  /*static getTheme() => ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme(
      primary: flamingo,
      secondary: lightening_yellow,
      onPrimary: black1,
      onSecondary: black1,
      surface: white,
      onSurface: black1,
      error: BrutColors.primaryRed,
      onError: black1,
      brightness: Brightness.light,
      shadow: black1,
      outline: black1,
      surfaceTint: whiteSecondary,
      background: white,
      onBackground:  black1,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: black1,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: black1,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: black1,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: black1,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black1,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: black1,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: black1,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: black1,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: black1,
      ),
    ),
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    primaryColor: black1,
    appBarTheme: const AppBarTheme(
      backgroundColor: white,
      foregroundColor: black1,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: black1,
      ),
      iconTheme: IconThemeData(
        color: black1,
      ),
    ),

  );*/
}