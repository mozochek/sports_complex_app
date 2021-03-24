import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/email_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/password_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/simple_switch.dart';
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
        child: FutureBuilder<Map<String, dynamic>>(
          future: bloc.getCachedData(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final cacheMap = snapshot.data!;
              return CustomScrollView(
                slivers: <Widget>[
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                EmailTextField(
                                  initialValue: cacheMap['email'] as String?,
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
                                SimpleSwitch(
                                  label: 'Запомнить email',
                                  valueStream: bloc.isEmailRememberedStream,
                                  onChanged: bloc.changeIsEmailRemembered,
                                ),
                                const SignInButton(),
                                const DoNotHaveAnAccountText(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const LoadingIndicator();
          },
        ),
      ),
    );
  }
}
