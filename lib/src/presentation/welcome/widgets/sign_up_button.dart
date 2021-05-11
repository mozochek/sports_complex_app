import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => context.router.push(const SignUpScreenRoute()),
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
          child: Text(S.current.sign_up_text),
        ),
      ),
    );
  }
}
