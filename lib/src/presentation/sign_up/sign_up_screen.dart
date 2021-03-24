import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/email_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/password_text_field.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/already_registered_text.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/sign_up_button.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/user_name_text_field.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/user_surname_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ISignUpBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      S.current.sign_up_screen_title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      S.current.sign_up_screen_subtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: UserSurnameTextField(
                        userSurnameStream: bloc.userSurname,
                        onChanged: bloc.changeSurname,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: UserNameTextField(
                        userNameStream: bloc.userName,
                        onChanged: bloc.changeName,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: EmailTextField(
                        emailStream: bloc.email,
                        onChanged: bloc.changeEmail,
                      ),
                    ),
                    PasswordTextField(
                      passwordStream: bloc.password,
                      onChanged: bloc.changePassword,
                    ),
                    const SignUpButton(),
                    const AlreadyRegisteredText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
