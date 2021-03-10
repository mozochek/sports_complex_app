import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/email_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/password_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/sign_in/widgets/do_not_have_an_account_text.dart';
import 'package:sports_complex_app/src/presentation/sign_in/widgets/sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ISignInBloc>(context);

    return ScaffoldWrapper(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(S.current.sign_in_screen_text),
              EmailTextField(
                emailStream: bloc.email,
                onChanged: bloc.changeEmail,
              ),
              PasswordTextField(
                passwordStream: bloc.password,
                onChanged: bloc.changePassword,
              ),
              const SignInButton(),
              const DoNotHaveAnAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
