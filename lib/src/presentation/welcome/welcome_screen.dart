import 'package:flutter/material.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO: add localization
            const Text('Приветствуем Вас'),
            ElevatedButton(
              onPressed: () async {
                await getIt<ISportsComplexRouter>().pushAndRemoveUntil(
                  ScreenRoutes.signIn,
                  predicate: (route) => route.settings.name == '/',
                );
              },
              // TODO: add localization
              child: const Text('Авторизация'),
            ),
            ElevatedButton(
              onPressed: () async {
                await getIt<ISportsComplexRouter>().pushAndRemoveUntil(
                  ScreenRoutes.signUp,
                  predicate: (route) => route.settings.name == '/',
                );
              },
              // TODO: add localization
              child: const Text('Регистрация'),
            ),
          ],
        ),
      ),
    );
  }
}
