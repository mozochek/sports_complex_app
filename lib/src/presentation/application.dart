import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';
import 'package:sports_complex_app/src/presentation/themes.dart';
import 'package:sports_complex_app/src/presentation/welcome/welcome_screen.dart';

class Application extends StatefulWidget {
  const Application({
    Key? key,
  }) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Спортивный комплекс',
      theme: AppThemes.mainTheme,
      navigatorKey: getIt<ISportsComplexRouter>().rootNavigatorKey,
      home: const WelcomeScreen(),
    );
  }
}
