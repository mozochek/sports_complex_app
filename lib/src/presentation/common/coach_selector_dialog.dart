import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/presentation/common/coach_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/common/list_is_empty_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';


class CoachSelectorDialog extends StatelessWidget {
  const CoachSelectorDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
      title: Material(
        elevation: 2.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Выберите тренера:',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      children: [
        StreamBuilder<List<Coach>>(
          stream: Provider.of<ICoachesWatcherBloc>(context).streamOfObjects,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                return snapshot.data.isNotEmpty
                    ? ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          final coach = snapshot.data[index];
                          return CoachListTile(
                            coach: coach,
                            onTap: () {
                              Navigator.of(context).pop<Coach>(coach);
                            },
                          );
                        },
                      )
                    : const ListIsEmptyIndicator();
              }
            }
            return const LoadingIndicator();
          },
        ),
      ],
    );
  }
}
