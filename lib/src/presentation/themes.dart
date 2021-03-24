import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/presentation/colors.dart';

// TODO: play around with theme
class AppThemes {
  static final ThemeData mainTheme = ThemeData(
    // Main colors
    fontFamily: 'ProximaNova',
    // brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.primaryDark,
    accentColor: AppColors.secondaryRed,
    primaryColorDark: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    dialogBackgroundColor: AppColors.primaryDark,
    hintColor: AppColors.textWhite,
    colorScheme: ColorScheme(
      primary: AppColors.red[700]!,
      primaryVariant: AppColors.dark[900]!,
      secondary: AppColors.red[700]!,
      secondaryVariant: AppColors.red[900]!,
      background: AppColors.dark[900]!,
      surface: AppColors.dark[800]!,
      error: AppColors.red[700]!,
      onPrimary: AppColors.textWhite,
      onSecondary: AppColors.textWhite,
      onSurface: AppColors.textWhite,
      onBackground: AppColors.textWhite,
      onError: AppColors.textWhite,
      brightness: Brightness.dark,
    ),
    // canvasColor: AppColors.darkAccent,
    // cardColor: AppColors.primaryDark,
    // App bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
    ),

    // Bottom navbar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDark,
      selectedItemColor: AppColors.secondaryRed,
      unselectedItemColor: AppColors.textGrey,
    ),

    // Buttons
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.textGrey;
            }
            return AppColors.secondaryRed;
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => const TextStyle(
            color: AppColors.textWhite,
          ),
        ),
      ),
    ),
    toggleableActiveColor: AppColors.secondaryRed,

    // Fab theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryRed,
      foregroundColor: AppColors.textWhite,
    ),
    // Text theme
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.textWhite,
      ),
      headline2: TextStyle(
        color: AppColors.textWhite,
      ),
      headline3: TextStyle(
        color: AppColors.textWhite,
      ),
      headline4: TextStyle(
        color: AppColors.textWhite,
      ),
      headline5: TextStyle(
        color: AppColors.textWhite,
      ),
      headline6: TextStyle(
        color: AppColors.textWhite,
      ),
      subtitle1: TextStyle(
        color: AppColors.textWhite,
      ),
      subtitle2: TextStyle(
        color: AppColors.textWhite,
      ),
      bodyText1: TextStyle(
        color: AppColors.textWhite,
      ),
      bodyText2: TextStyle(
        color: AppColors.textWhite,
      ),
    ),
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.textWhite,
      ),
      headline2: TextStyle(
        color: AppColors.textWhite,
      ),
      headline3: TextStyle(
        color: AppColors.textWhite,
      ),
      headline4: TextStyle(
        color: AppColors.textWhite,
      ),
      headline5: TextStyle(
        color: AppColors.textWhite,
      ),
      headline6: TextStyle(
        color: AppColors.textWhite,
      ),
      subtitle1: TextStyle(
        color: AppColors.textWhite,
      ),
      subtitle2: TextStyle(
        color: AppColors.textWhite,
      ),
      bodyText1: TextStyle(
        color: AppColors.textWhite,
      ),
      bodyText2: TextStyle(
        color: AppColors.textWhite,
      ),
    ),
    accentTextTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.textWhite,
      ),
      headline2: TextStyle(
        color: AppColors.textWhite,
      ),
      headline3: TextStyle(
        color: AppColors.textWhite,
      ),
      headline4: TextStyle(
        color: AppColors.textWhite,
      ),
      headline5: TextStyle(
        color: AppColors.textWhite,
      ),
      headline6: TextStyle(
        color: AppColors.textWhite,
      ),
      subtitle1: TextStyle(
        color: AppColors.textWhite,
      ),
      subtitle2: TextStyle(
        color: AppColors.textWhite,
      ),
      bodyText1: TextStyle(
        color: AppColors.textWhite,
      ),
      bodyText2: TextStyle(
        color: AppColors.textWhite,
      ),
    ),

    // Text Field themes
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.secondaryRed,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      // fillColor: AppColors.darkAccent,
      errorMaxLines: 2,
      labelStyle: TextStyle(
        color: AppColors.textGrey,
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
  );
}
