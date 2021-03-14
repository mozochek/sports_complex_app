import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/email_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/password_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
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

    return ScaffoldWrapper(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(S.current.sign_up_screen_text),
              UserSurnameTextField(
                userSurnameStream: bloc.userSurname,
                onChanged: bloc.changeSurname,
              ),
              UserNameTextField(
                userNameStream: bloc.userName,
                onChanged: bloc.changeName,
              ),
              EmailTextField(
                emailStream: bloc.email,
                onChanged: bloc.changeEmail,
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
    );
  }
}
