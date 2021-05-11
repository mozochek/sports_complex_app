import 'package:flutter/material.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/theme/app_theme_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/screen_wide_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = getIt<AppThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              ScreenWideSwitch(
                label: 'Темная тема',
                valueStream: themeBloc.isDarkTheme,
                onChanged: (_) async => themeBloc.switchTheme(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
