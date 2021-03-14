import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/halls/actor_bloc/i_hall_actor_bloc.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/hall_form_bloc.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';
import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/presentation/common/delete_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/hall_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/common/list_is_empty_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/hall_form.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/halls_screen/widgets/halls_screen_fab_widget.dart';

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
              final listOfHalls = snapshot.data!;
              return listOfHalls.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: listOfHalls.length,
                      itemBuilder: (_, index) {
                        final hall = listOfHalls[index];
                        return HallListTile(
                          hall: hall,
                          onTap: () async {
                            await Navigator.of(context).push<void>(
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (_) => Provider<IHallFormBloc>(
                                  create: (_) => HallFormBloc.forEditing(hall),
                                  dispose: (_, bloc) async => bloc.dispose(),
                                  child: HallForm(editedHall: hall),
                                ),
                              ),
                            );
                          },
                          onLongPress: () async {
                            final isDeleteConfirmed = await showDialog<bool>(
                              context: context,
                              builder: (_) {
                                return DeleteDialog(
                                  title: S.current.hall_delete_dialog_title,
                                  content: S.current.hall_delete_dialog_content,
                                );
                              },
                            );

                            // Null check in this statement work when user tap outside of dialog.
                            // In this case we didn't get any response from dialog so as default
                            // we set it to false
                            if (isDeleteConfirmed ?? false) {
                              await Provider.of<IHallsActorBloc>(
                                context,
                                listen: false,
                              ).delete(hall);
                            }
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
      floatingActionButton: const HallsScreenFab(),
    );
  }
}
