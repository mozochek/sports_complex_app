import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/email_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/password_text_field.dart';
import 'package:sports_complex_app/src/presentation/sign_in/widgets/do_not_have_an_account_text.dart';
import 'package:sports_complex_app/src/presentation/sign_in/widgets/sign_in_button.dart';
import 'package:sports_complex_app/src/presentation/sign_in/widgets/sign_in_picture.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ISignInBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        const SignInPicture(),
                        Text(
                          S.current.sign_in_screen_title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          S.current.sign_in_screen_subtitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        EmailTextField(
                          emailStream: bloc.email,
                          onChanged: bloc.changeEmail,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: PasswordTextField(
                            passwordStream: bloc.password,
                            onChanged: bloc.changePassword,
                          ),
                        ),
                        const SignInButton(),
                        const DoNotHaveAnAccountText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
