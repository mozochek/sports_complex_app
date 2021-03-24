import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';

class DoNotHaveAnAccountText extends StatelessWidget {
  const DoNotHaveAnAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${S.current.do_not_have_an_account_text}?',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        GestureDetector(
          onTap: () async => getIt<ISportsComplexRouter>().pushAndRemoveUntil(
            ScreenRoutes.signUp,
            predicate: (route) => route.settings.name == '/',
          ),
          child: Text(
            ' ${S.current.sign_up_text}',
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
