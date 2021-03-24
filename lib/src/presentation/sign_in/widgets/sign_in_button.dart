import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ISignInBloc>(context);

    return StreamBuilder<bool>(
      stream: bloc.isSignInAllowed,
      builder: (_, snapshot) {
        final isSignInAllowed = snapshot.data ?? false;
        return TextButton(
          onPressed: isSignInAllowed ? () async => bloc.signIn() : null,
          child: Text(S.current.sign_in_text),
        );
      },
    );
  }
}
