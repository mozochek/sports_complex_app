import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart';
import 'package:sports_complex_app/src/presentation/sign_up/sign_up_screen.dart';

class DoNotHaveAnAccountText extends StatelessWidget {
  const DoNotHaveAnAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('${S.current.do_not_have_an_account_text}?'),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil<Widget>(
              MaterialPageRoute(
                builder: (_) => Provider<ISignUpBloc>(
                  create: (_) => getIt<ISignUpBloc>(),
                  dispose: (_, bloc) async => bloc.dispose(),
                  child: const SignUpScreen(),
                ),
              ),
              (route) => false,
            );
          },
          child: Text(
            ' ${S.current.sign_up_text}',
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
