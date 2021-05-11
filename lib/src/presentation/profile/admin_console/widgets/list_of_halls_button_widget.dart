import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/halls_screen/halls_screen.dart';

class ListOfHallsButton extends StatelessWidget {
  const ListOfHallsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // TODO: old navigation
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => const HallsScreen(),
          ),
        );
      },
      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.volleyballBall,
          color: Colors.lightBlue,
        ),
        title: Text(
          S.current.list_of_halls_text,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
