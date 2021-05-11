import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/theme/app_theme_bloc.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';
import 'package:sports_complex_app/src/presentation/themes.dart';

class Application extends StatelessWidget {
  Application({
    Key? key,
  }) : super(key: key);

  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeBloc = getIt<AppThemeBloc>();

    return StreamBuilder<bool>(
      stream: themeBloc.isDarkTheme,
      builder: (_, snapshot) {
        return MaterialApp.router(
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
          title: 'Спортивный комплекс',
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: snapshot.data ?? true
              ? AppThemes.mainTheme
              : AppThemes.lightTheme,
        );
      },
    );
  }
}
