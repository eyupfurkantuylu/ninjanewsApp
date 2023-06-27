import 'package:flutter/material.dart';

class Generics {
  // COLORS
  static Color ninjaDarkBackground = Colors.black;
  static Color ninjaLightBackground = Colors.white;
  static Color ninjaGray = Colors.grey;
  static Color ninjaWhite = Colors.white;
  static int ninjaNewsYellow = 0xFFffd32e;
  static Color ninjaRed = Colors.red;
  static Color ninjaTextBlack = Colors.black;
  static Color ninjaTextWhite = Colors.white;

  // SIZE
  static double ninjaNormalFontSize = 18.0;

  // STYLE
  static TextStyle ninjaTitleTextStyle = TextStyle(
    color: Generics.ninjaTextWhite,
    fontSize: Generics.ninjaNormalFontSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static TextStyle ninjaSubtitleTextStyle = const TextStyle(
    color: Colors.white70,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    height: 2.0,
  );
  static TextStyle ninjaNormalTextStyle = TextStyle(
    color: Generics.ninjaTextWhite,
    fontSize: Generics.ninjaNormalFontSize,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
}
