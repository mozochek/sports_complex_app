import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ISignUpBloc>(context);

    return StreamBuilder<bool>(
      stream: bloc.isSignUpAllowed,
      builder: (_, snapshot) {
        final isSignUpAllowed = snapshot.data ?? false;
        return TextButton(
          onPressed: isSignUpAllowed ? () async => bloc.signUp() : null,
          child: Text(S.current.sign_up_text),
        );
      },
    );
  }
}
