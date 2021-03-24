import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => getIt<ISportsComplexRouter>().pushAndRemoveUntil(
        ScreenRoutes.signUp,
        predicate: (route) => route.settings.name == '/',
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 50.0,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Center(
          child: Text(
            S.current.sign_up_text,
            style: Theme.of(context).textButtonTheme.style!.textStyle!.resolve(
                  MaterialState.values.toSet(),
                ),
          ),
        ),
      ),
    );
  }
}
