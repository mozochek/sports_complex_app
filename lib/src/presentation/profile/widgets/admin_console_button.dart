import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/colors.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';

class AdminConsoleButton extends StatelessWidget {
  const AdminConsoleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async =>
          context.router.push(const AdminConsoleScreenRoute()),
      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.userShield,
          color: AppColors.blue,
        ),
        title: Text(
          S.current.admin_console_text,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
