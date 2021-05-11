import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50.0,
      child: Center(
        child: TextButton(
          onPressed: () async => context.router.push(const SignInScreenRoute()),
          child: Text(S.current.sign_in_text),
        ),
      ),
    );
  }
}
