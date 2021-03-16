import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/presentation/common/list_is_empty_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/halls_screen/widgets/halls_screen_fab_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/halls_screen/widgets/list_of_halls.dart';

class HallsScreen extends StatelessWidget {
  const HallsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text(S.current.list_of_halls_text),
      ),
      body: StreamBuilder<List<Hall>>(
        stream: Provider.of<IHallsWatcherBloc>(context).streamOfObjects,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              // TODO: !
              final halls = snapshot.data!;
              return halls.isNotEmpty
                  ? ListOfHalls(halls: halls)
                  : const ListIsEmptyIndicator();
            }
          }
          return const LoadingIndicator();
        },
      ),
      floatingActionButton: const HallsScreenFab(),
    );
  }
}
