import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';

class AdminConsoleButton extends StatelessWidget {
  const AdminConsoleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async =>
          getIt<ISportsComplexRouter>().push(ScreenRoutes.adminConsole),
      child: ListTile(
        leading: const Icon(
          Icons.admin_panel_settings,
          color: Colors.lightBlue,
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
