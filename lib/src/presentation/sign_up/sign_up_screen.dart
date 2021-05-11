import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/email_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/password_text_field.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/already_registered_text.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/sign_up_button.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/user_name_text_field.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/user_surname_text_field.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final ISignUpBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<ISignUpBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        userSurnameStream: _bloc.userSurname,
                        onChanged: _bloc.changeSurname,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: UserNameTextField(
                        userNameStream: _bloc.userName,
                        onChanged: _bloc.changeName,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: EmailTextField(
                        emailStream: _bloc.email,
                        onChanged: _bloc.changeEmail,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: PasswordTextField(
                        passwordStream: _bloc.password,
                        onChanged: _bloc.changePassword,
                      ),
                    ),
                    SignUpButton(
                      buttonAvailabilityStream: _bloc.isSignUpAllowed,
                      onPressed: () async {
                        final isUserSignedUp = await _bloc.signUp();
                        if (isUserSignedUp ?? false) {
                          await context.router.pushAndPopUntil(
                            const SignInScreenRoute(),
                            predicate: (route) => route.settings.name == '/',
                          );
                        }
                      },
                    ),
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

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
