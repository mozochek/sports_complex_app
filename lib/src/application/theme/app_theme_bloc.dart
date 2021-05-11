import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/src/presentation/colors.dart';

@Singleton(
  env: <String>[
    Environment.dev,
    Environment.test,
  ],
)
class AppThemeBloc {
  final _isDarkThemeController = BehaviorSubject<bool>();

  Stream<bool> get isDarkTheme => _isDarkThemeController.stream;

  Future<void> setInitialTheme() async {
    final box = await Hive.openBox<bool>('states');
    final isDarkTheme = box.get('isDarkTheme') ?? true;
    if (isDarkTheme) {
      _switchToDark();
    } else {
      _switchToLight();
    }
    _isDarkThemeController.add(isDarkTheme);
    await box.close();
  }

  Future<void> switchTheme() async {
    final bool isDarkTheme = _isDarkThemeController.value ?? true;
    if (isDarkTheme) {
      _switchToLight();
    } else {
      _switchToDark();
    }
    await _cacheDarkThemeState(!isDarkTheme);
    _isDarkThemeController.add(!isDarkTheme);
  }

  void _switchToDark() {
    final style = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: AppColors.dark[800]!,
      systemNavigationBarDividerColor: AppColors.transparent,
      statusBarColor: AppColors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  void _switchToLight() {
    final style = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarDividerColor: AppColors.transparent,
      statusBarColor: AppColors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  Future<void> _cacheDarkThemeState(bool state) async {
    final box = await Hive.openBox<bool>('states');
    await box.put('isDarkTheme', state);
    await box.close();
  }

  Future<void> dispose() async => _isDarkThemeController.close();
}
