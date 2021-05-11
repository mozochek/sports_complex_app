import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';

class AlreadyRegisteredText extends StatelessWidget {
  const AlreadyRegisteredText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${S.current.already_registered_text}?',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        TextButton(
          onPressed: () async => context.router.pushAndPopUntil(
            const SignInScreenRoute(),
            predicate: (route) =>
                route.settings.name == WelcomeScreenRoute.name,
          ),
          child: Text(S.current.sign_in_text),
        ),
      ],
    );
  }
}
