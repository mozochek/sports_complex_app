import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_complex_app/injection.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/presentation/sign_in/sign_in_screen.dart';

class AlreadyRegisteredText extends StatelessWidget {
  const AlreadyRegisteredText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('${S.current.already_registered_text}?'),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil<Widget>(
              MaterialPageRoute(
                builder: (_) => Provider<ISignInBloc>(
                  create: (_) => getIt<ISignInBloc>(),
                  dispose: (_, bloc) => bloc.dispose(),
                  child: const SignInScreen(),
                ),
              ),
              (route) => false,
            );
          },
          child: Text(
            ' ${S.current.sign_in_text}',
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
