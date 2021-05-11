import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/presentation/colors.dart';

class AppThemes {
  static final ThemeData mainTheme = darkTheme;

  static final ThemeData darkTheme = ThemeData(
    // Main colors
    fontFamily: 'ProximaNova',
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.primaryDark,
    accentColor: AppColors.secondaryRed,
    primaryColorDark: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    dialogBackgroundColor: AppColors.primaryDark,
    hintColor: AppColors.white,
    splashColor: AppColors.secondaryRed.withOpacity(0.25),
    highlightColor: AppColors.secondaryRed.withOpacity(0.5),
    toggleableActiveColor: AppColors.secondaryRed,
    colorScheme: ColorScheme(
      primary: AppColors.red[700]!,
      primaryVariant: AppColors.dark[900]!,
      secondary: AppColors.red[700]!,
      secondaryVariant: AppColors.red[900]!,
      background: AppColors.dark[900]!,
      surface: AppColors.dark[800]!,
      error: AppColors.red[700]!,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.white,
      onBackground: AppColors.white,
      onError: AppColors.white,
      brightness: Brightness.dark,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark[800]!,
    ),

    // Bottom navbar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark[800]!,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white38,
    ),

    // Fab theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryRed,
      foregroundColor: AppColors.white,
    ),

    // Text theme
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.white,
      ),
      headline2: TextStyle(
        color: AppColors.white,
      ),
      headline3: TextStyle(
        color: AppColors.white,
      ),
      headline4: TextStyle(
        color: AppColors.white,
      ),
      headline5: TextStyle(
        color: AppColors.white,
      ),
      headline6: TextStyle(
        color: AppColors.white,
      ),
      subtitle1: TextStyle(
        color: AppColors.white,
      ),
      subtitle2: TextStyle(
        color: AppColors.white,
      ),
      bodyText1: TextStyle(
        color: AppColors.white,
      ),
      bodyText2: TextStyle(
        color: AppColors.white,
      ),
      caption: TextStyle(
        color: AppColors.white,
      ),
    ),
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.white,
      ),
      headline2: TextStyle(
        color: AppColors.white,
      ),
      headline3: TextStyle(
        color: AppColors.white,
      ),
      headline4: TextStyle(
        color: AppColors.white,
      ),
      headline5: TextStyle(
        color: AppColors.white,
      ),
      headline6: TextStyle(
        color: AppColors.white,
      ),
      subtitle1: TextStyle(
        color: AppColors.white,
      ),
      subtitle2: TextStyle(
        color: AppColors.white,
      ),
      bodyText1: TextStyle(
        color: AppColors.white,
      ),
      bodyText2: TextStyle(
        color: AppColors.white,
      ),
      caption: TextStyle(
        color: AppColors.white,
      ),
    ),
    accentTextTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.white,
      ),
      headline2: TextStyle(
        color: AppColors.white,
      ),
      headline3: TextStyle(
        color: AppColors.white,
      ),
      headline4: TextStyle(
        color: AppColors.white,
      ),
      headline5: TextStyle(
        color: AppColors.white,
      ),
      headline6: TextStyle(
        color: AppColors.white,
      ),
      subtitle1: TextStyle(
        color: AppColors.white,
      ),
      subtitle2: TextStyle(
        color: AppColors.white,
      ),
      bodyText1: TextStyle(
        color: AppColors.white,
      ),
      bodyText2: TextStyle(
        color: AppColors.white,
      ),
      caption: TextStyle(
        color: AppColors.white,
      ),
    ),

    // Text Field themes
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.secondaryRed,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorMaxLines: 2,
      labelStyle: TextStyle(
        color: AppColors.white24,
      ),
      errorStyle: TextStyle(
        color: AppColors.secondaryRed,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryRed,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryRed,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryRed,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryRed,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryRed,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
      ),
    ),

    // Icon themes
    iconTheme: const IconThemeData(
      color: AppColors.secondaryRed,
    ),
    primaryIconTheme: const IconThemeData(
      color: AppColors.secondaryRed,
    ),
    accentIconTheme: const IconThemeData(
      color: AppColors.secondaryRed,
    ),

    tooltipTheme: const TooltipThemeData(
      textStyle: TextStyle(
        color: AppColors.white,
      ),
      decoration: BoxDecoration(
        color: AppColors.white24,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'ProximaNova',
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
