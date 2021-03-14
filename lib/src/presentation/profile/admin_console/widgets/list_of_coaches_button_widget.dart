import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/coaches/actor_bloc/i_coaches_actor_bloc.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coaches_screen/coaches_screen.dart';

class ListOfCoachesButton extends StatelessWidget {
  const ListOfCoachesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => MultiProvider(
              providers: [
                Provider<ICoachesWatcherBloc>(
                  create: (_) => getIt<ICoachesWatcherBloc>(),
                ),
                Provider<ICoachesActorBloc>(
                  create: (_) => getIt<ICoachesActorBloc>(),
                ),
              ],
              child: const CoachesScreen(),
            ),
          ),
        );
      },
      child: ListTile(
        leading: const Icon(Icons.people),
        title: Text(
          S.current.list_of_coaches_text,
        ),
      ),
    );
  }
}
