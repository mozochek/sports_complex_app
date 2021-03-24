import 'package:flutter/material.dart';

const Color darkCool = Color(0xFF191919);
const Color redCool = Color(0xFFD23131);

class AppColors {
  static const int _red = 0xFFD23131;
  static const int _dark = 0xFF191919;
  static const int _darkAccent = 0xFF181617;

  static const Color primaryDark = Color(_dark);
  static const Color darkAccent = Color(_darkAccent);
  static const Color secondaryRed = Color(_red);
  static const Color textWhite = Colors.white;
  static const Color textGrey = Colors.white24;

  static MaterialColor red = const MaterialColor(
    _red,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFECDD2),
      200: Color(0xFFEE9A9B),
      300: Color(0xFFE47474),
      400: Color(0xFFEE5452),
      500: Color(0xFFF34438),
      600: Color(0xFFE43B37),
      700: Color(_red),
      800: Color(0xFFC52A2A),
      900: Color(0xFFB61F1E),
    },
  );

  static MaterialColor dark = const MaterialColor(
    _dark,
    <int, Color>{
      50: Color(0xFFF8F8F8),
      100: Color(0xFFF1F1F1),
      200: Color(0xFFE7E7E7),
      300: Color(0xFFD7D7D7),
      400: Color(0xFFB3B3B3),
      500: Color(0xFF939393),
      600: Color(0xFF6B6B6B),
      700: Color(0xFF575757),
      800: Color(0xFF393939),
      900: Color(_dark),
    },
  );
}
