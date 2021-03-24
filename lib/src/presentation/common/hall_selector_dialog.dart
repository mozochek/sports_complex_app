import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/presentation/common/hall_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/common/list_is_empty_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';

class HallSelectorDialog extends StatelessWidget {
  const HallSelectorDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      title: Material(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // TODO: add localization
          child: Text(
            'Выберите зал:',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      children: <Widget>[
        StreamBuilder<List<Hall>>(
          stream: Provider.of<IHallsWatcherBloc>(context).streamOfObjects,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                return snapshot.data!.isNotEmpty
                    ? ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          final hall = snapshot.data![index];
                          return HallListTile(
                            hall: hall,
                            onTap: () {
                              Navigator.of(context).pop<Hall>(hall);
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
