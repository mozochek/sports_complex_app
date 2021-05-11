import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/email_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/password_text_field.dart';
import 'package:sports_complex_app/src/presentation/common/simple_switch.dart';
import 'package:sports_complex_app/src/presentation/sign_in/widgets/do_not_have_an_account_text.dart';
import 'package:sports_complex_app/src/presentation/sign_in/widgets/sign_in_button.dart';
import 'package:sports_complex_app/src/presentation/sign_in/widgets/sign_in_picture.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final ISignInBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<ISignInBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _bloc.getCachedData(),
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
                                  emailStream: _bloc.email,
                                  onChanged: _bloc.changeEmail,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: PasswordTextField(
                                    passwordStream: _bloc.password,
                                    onChanged: _bloc.changePassword,
                                  ),
                                ),
                                SimpleSwitch(
                                  label: 'Запомнить email',
                                  valueStream: _bloc.isEmailRememberedStream,
                                  onChanged: _bloc.changeIsEmailRemembered,
                                ),
                                SignInButton(
                                  buttonAvailabilityStream:
                                      _bloc.isSignInAllowed,
                                  onPressed: () async {
                                    final isUserSignedIn = await _bloc.signIn();
                                    if (isUserSignedIn ?? false) {
                                      await context.router.pushAndPopUntil(
                                        BottomNavigationRoute(),
                                        predicate: (route) =>
                                            route.settings.name ==
                                            BottomNavigationRoute.name,
                                      );
                                    }
                                  },
                                ),
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

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
