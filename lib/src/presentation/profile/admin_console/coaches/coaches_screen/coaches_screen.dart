import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/presentation/common/list_is_empty_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coaches_screen/widgets/list_of_coaches.dart';

class CoachesScreen extends StatelessWidget {
  const CoachesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text(S.current.list_of_coaches_text),
      ),
      body: StreamBuilder<List<Coach>>(
        stream: getIt<ICoachesWatcherBloc>().streamOfObjects,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              // TODO: !
              final coaches = snapshot.data!;
              return coaches.isNotEmpty
                  ? ListOfCoaches(coaches: coaches)
                  : const ListIsEmptyIndicator();
            }
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
