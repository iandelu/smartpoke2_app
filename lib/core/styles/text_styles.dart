import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';

class AppTextStyles {
  final TextStyle sRegular = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );
  final TextStyle sThick = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );
  final TextStyle mRegular = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 22,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );
  final TextStyle mThick = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 22,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );

  final lThin = GoogleFonts.workSans(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 36,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );

  final lRegular = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 26,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );

  final lThick = const TextStyle(
    fontFamily: 'Tanker',
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
    fontSize: 36,
    color: flamingo,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );

  get emojiCategory => const TextStyle(
    fontFamily: 'NotoEmoji',
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
}
