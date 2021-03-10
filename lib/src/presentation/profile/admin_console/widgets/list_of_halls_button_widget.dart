import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/halls/actor_bloc/i_hall_actor_bloc.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/halls_screen/halls_screen.dart';

class ListOfHallsButton extends StatelessWidget {
  const ListOfHallsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => MultiProvider(
              providers: [
                Provider(
                  create: (_) => getIt<IHallsWatcherBloc>(),
                ),
                Provider(
                  create: (_) => getIt<IHallsActorBloc>(),
                ),
              ],
              child: const HallsScreen(),
            ),
          ),
        );
      },
      child: ListTile(
        leading: const Icon(Icons.sports_volleyball),
        title: Text(
          S.current.list_of_halls_text,
        ),
      ),
    );
  }
}
