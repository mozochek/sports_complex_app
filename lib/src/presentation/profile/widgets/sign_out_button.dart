import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/domain/auth/i_auth.dart';
import 'package:sports_complex_app/src/presentation/common/confirmation_dialog.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final isSignOutConfirmed = await showDialog<bool>(
          context: context,
          builder: (_) {
            return ConfirmationDialog(
              title: S.current.sign_out_confirmation_dialog_title,
              content: S.current.sign_out_confirmation_dialog_content,
              confirmButtonText: S.current.sign_out_text,
              refuseButtonText: S.current.cancel_text,
            );
          },
        );

        if (isSignOutConfirmed ?? false) {
          await getIt<IAuth>().signOut();
          await context.router.pushAndPopUntil(
            const WelcomeScreenRoute(),
            predicate: (route) => route.settings.name == '/',
          );
        }
      },
      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.signOutAlt,
        ),
        title: Text(
          S.current.sign_out_text,
        ),
      ),
    );
  }
}
