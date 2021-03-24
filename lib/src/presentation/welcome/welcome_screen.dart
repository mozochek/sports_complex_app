import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/welcome/widgets/sign_in_button.dart';
import 'package:sports_complex_app/src/presentation/welcome/widgets/sign_up_button.dart';
import 'package:sports_complex_app/src/presentation/welcome/widgets/welcome_picture.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const WelcomePicture(),
                          const SizedBox(height: 20.0),
                          Text(
                            S.current.welcome_text,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            '${S.current.sports_complex_text} | ${S.current.workouts_schedule_text} | ${S.current.health_text}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        SignUpButton(),
                        SignInButton(),
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
