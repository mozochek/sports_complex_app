import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/profile/favorite_workouts/favorite_workouts_screen.dart';

class FavoriteWorkoutsButton extends StatelessWidget {
  const FavoriteWorkoutsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // TODO: old navigation
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => const FavoriteWorkoutsScreen(),
          ),
        );
      },
      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.star,
          color: Colors.yellow,
        ),
        title: Text(
          S.current.favorite_workouts_text,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
