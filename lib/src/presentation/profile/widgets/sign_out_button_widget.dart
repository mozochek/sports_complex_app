import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/domain/auth/i_auth.dart';
import 'package:sports_complex_app/src/presentation/common/confirmation_dialog.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        }
      },
      child: ListTile(
        leading: const Icon(
          Icons.logout,
          color: Colors.red,
        ),
        title: Text(
          S.current.sign_out_text,
        ),
      ),
    );
  }
}
