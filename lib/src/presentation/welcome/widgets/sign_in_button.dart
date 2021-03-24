import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => getIt<ISportsComplexRouter>().pushAndRemoveUntil(
        ScreenRoutes.signIn,
        predicate: (route) => route.settings.name == '/',
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50.0,
        child: Center(
          child: Text(
            S.current.sign_in_text,
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
      ),
    );
  }
}
