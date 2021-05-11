import 'package:flutter/material.dart';

class AppColors {
  static const int _red = 0xFFD23131;
  static const int _dark = 0xFF191919;
  // static const int _dark = 0xFF1F1F1F;

  // new colors
  static const int _textFieldFillColor = 0xFF181617;
  static const Color _textFieldFillColor1 = Color(0xFF181617);
  static const Color textFieldFillColor = Color(_textFieldFillColor);

  static const int _yellow = 0xFFFFB31A;
  static const Color _yellow1 = Color(0xFFFFB31A);
  static const Color yellow = Color(_yellow);

  static const int _lightGreen = 0xFF34E53D;
  static const Color _lightGreen1 = Color(0xFF34E53D);
  static const Color lightGreen = Color(_lightGreen);

  static const int _newRed = 0xFFBF2E30;
  static const Color _newRed1 = Color(0xFFBF2E30);
  static const Color newRed = Color(_newRed);

  static const int _orange = 0xFFFC8B0A;
  static const Color _orange1 = Color(0xFFFC8B0A);
  static const Color orange = Color(_orange);

  static const int _green = 0xFF5AAB12;
  static const Color _green1 = Color(0xFF5AAB12);
  static const Color green = Color(_green);

  static const int _aquaBlue = 0xFF17B6C6;
  static const Color _aquaBlue1 = Color(0xFF17B6C6);
  static const Color aquaBlue = Color(_aquaBlue);

  static const int _deepBlue = 0xFF2943D7;
  static const Color _deepBlue1 = Color(0xFF2943D7);
  static const Color deepBlue = Color(_deepBlue);

  static const int _darkDark = 0xFF1A1A1A;
  static const Color _darkDark1 = Color(0xFF1A1A1A);
  static const Color darkDark = Color(_darkDark);

  static const int _backgroundDark = 0xFF1F1F1F;
  static const Color _backgroundDark1 = Color(0xFF1E1E1E);
  static const Color backgroundDark = Color(_backgroundDark);

  static const int _placeholderColor = 0xFF252525;
  static const Color _placeholderColor1 = Color(0xFF252525);
  static const Color placeholderColor = Color(_placeholderColor);

  //

  // static const Color primaryDark = Color(_dark);
  static const Color primaryDark = Color(0xFF191919);

  // static const Color darkAccent = Color(_darkAccent);
  static const Color darkAccent = Color(0xFF181617);

  // static const Color secondaryRed = Color(_red);
  static const Color secondaryRed = Color(0xFFD23131);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color white24 = Colors.white24;
  static const Color white38 = Colors.white38;
  static const Color grey = Colors.grey;
  static const Color blue = Colors.blue;
  static const Color deepPurple = Colors.deepPurple;
  static const Color transparent = Colors.transparent;

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

class NewAppColors {
  static const ThemeColors darkThemeColors = ThemeColors(
    primaryColor: dark,
    accentColor: red,
  );
  static const Color dark = Color(0xFF191919);
  static const Color red = Color(0xFFD23131);
  static const Color backgroundDark = Color(0xFF1E1E1E);


  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color white24 = Colors.white24;
  static const Color grey = Colors.grey;
  static const Color blue = Colors.blue;
  static const Color deepPurple = Colors.deepPurple;
  static const Color transparent = Colors.transparent;
}

class ThemeColors {
  const ThemeColors({
    required this.primaryColor,
    required this.accentColor,
  });

  final Color primaryColor;
  final Color accentColor;


}
