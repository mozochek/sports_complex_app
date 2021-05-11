import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.buttonAvailabilityStream,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Stream<bool> buttonAvailabilityStream;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: buttonAvailabilityStream,
      builder: (_, snapshot) {
        final isSignInAllowed = snapshot.data ?? false;
        return TextButton(
          onPressed: isSignInAllowed ? onPressed : null,
          child: Text(S.current.sign_in_text),
        );
      },
    );
  }
}
