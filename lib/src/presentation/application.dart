import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/presentation/sign_in/sign_in_screen.dart';

class Application extends StatelessWidget {
  const Application({
    Key key,
  }) : super(key: key);

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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          Provider<ISignInBloc>(
            create: (_) => getIt<ISignInBloc>(),
            dispose: (_, bloc) async => bloc.dispose(),
          ),
        ],
        child: const SignInScreen(),
      ),
    );
  }
}
