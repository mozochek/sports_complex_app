import 'package:flutter/material.dart';
import 'package:sports_complex_app/injection.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';

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
        GestureDetector(
          onTap: () async {
            await getIt<ISportsComplexRouter>().pushAndRemoveUntil(
              ScreenRoutes.signIn,
              predicate: (route) => route.settings.name == '/',
            );
          },
          child: Text(
            ' ${S.current.sign_in_text}',
            style: TextStyle(
              color: Theme.of(context)
                  .textButtonTheme
                  .style!
                  .foregroundColor!
                  .resolve({
                MaterialState.selected,
              }),
            ),
          ),
        ),
      ],
    );
  }
}
