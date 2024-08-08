import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';

class AppTextStyles {

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
    color: accentTeal1,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );

  get emojiCategory => const TextStyle(
    fontFamily: 'NotoEmoji',
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  get sRegular => const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );
}

const sRegular = TextStyle(
fontWeight: FontWeight.w400,
fontStyle: FontStyle.normal,
fontSize: 14,
decoration: TextDecoration.none,
letterSpacing: 0,
);

const TextStyle headline1 = TextStyle(
  fontFamily: 'Tanker',
  fontSize: 36.0,
  fontWeight: FontWeight.normal,
  height: 1.22,
);

const TextStyle headline2 = TextStyle(
  fontFamily: 'Tanker',
  fontSize: 32.0,
  fontWeight: FontWeight.normal,
  height: 1.25,
);

const TextStyle headline3 = TextStyle(
  fontFamily: 'Tanker',
  fontSize: 28.0,
  fontWeight: FontWeight.normal,
);

const TextStyle headline4 = TextStyle(
  fontFamily: 'Tanker',
  fontSize: 24.0,
  fontWeight: FontWeight.normal,
);

const TextStyle headline5 = TextStyle(
  fontFamily: 'Tanker',
  fontSize: 20.0,
  fontWeight: FontWeight.normal,
);

const TextStyle headline6 = TextStyle(
  fontFamily: 'Tanker',
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
);

const TextStyle subtitle1 = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 22.0,
  fontWeight: FontWeight.w100,
  height: 1.27,
  letterSpacing: 0.35,
);

const TextStyle bodyText1 = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

const TextStyle bodyText2 = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 18.0,
  fontWeight: FontWeight.w200,
);

const TextStyle caption = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
  height: 1.29,
  letterSpacing: -0.41,
);

const TextStyle button = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 17.0,
  fontWeight: FontWeight.normal,
  height: 1.29,
  letterSpacing: -0.41,
);

const TextStyle overline = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  height: 1.38,
);

const TextStyle subtitle2 = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  height: 1.31,
  letterSpacing: -0.32,
);

const TextStyle bodyText3 = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 14.0,
  fontWeight: FontWeight.w100,
  height: 1.36,
);

const TextStyle overline2 = TextStyle(
  fontFamily: 'CabinetGrotesk',
  fontSize: 13.0,
  fontWeight: FontWeight.normal,
  height: 1.38,
  letterSpacing: -0.08,
);


