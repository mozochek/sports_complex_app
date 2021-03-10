import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/profile/settings/settings_screen.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => const SettingsScreen(),
          ),
        );
      },
      child: ListTile(
        leading: const Icon(
          Icons.settings,
          color: Colors.black54,
        ),
        title: Text(
          S.current.settings_text,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
