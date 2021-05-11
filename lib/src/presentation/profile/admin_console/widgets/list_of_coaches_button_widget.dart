import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/colors.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coaches_screen/coaches_screen.dart';

class ListOfCoachesButton extends StatelessWidget {
  const ListOfCoachesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => const CoachesScreen(),
          ),
        );
      },
      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.users,
          color: AppColors.deepPurple,
        ),
        title: Text(
          S.current.list_of_coaches_text,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
