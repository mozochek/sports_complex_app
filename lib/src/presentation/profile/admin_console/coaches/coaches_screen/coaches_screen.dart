import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/coaches/actor_bloc/i_coaches_actor_bloc.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/coach_form_bloc.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/presentation/common/coach_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/common/delete_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/list_is_empty_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coach_form/coach_form.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coaches_screen/widgets/coaches_screen_fab_widget.dart';

class CoachesScreen extends StatelessWidget {
  const CoachesScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text(S.current.list_of_coaches_text),
      ),
      body: StreamBuilder<List<Coach>>(
        stream: Provider.of<ICoachesWatcherBloc>(context).streamOfObjects,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              return snapshot.data.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final coach = snapshot.data[index];
                        return CoachListTile(
                          coach: coach,
                          onTap: () async {
                            await Navigator.of(context).push<void>(
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (_) => Provider<ICoachFormBloc>(
                                  create: (_) =>
                                      CoachFormBloc.forEditing(coach),
                                  dispose: (_, bloc) async => bloc.dispose(),
                                  child: CoachForm(editedCoach: coach),
                                ),
                              ),
                            );
                          },
                          onLongPress: () async {
                            final isDeleteConfirmed = await showDialog<bool>(
                              context: context,
                              builder: (_) {
                                return DeleteDialog(
                                  title: S.current
                                      .coach_delete_confirmation_dialog_title,
                                  content: S.current
                                      .coach_delete_confirmation_dialog_content,
                                );
                              },
                            );

                            // Null check in this statement work when user tap outside of dialog.
                            // In this case we didn't get any response from dialog so as default
                            // we set it to false
                            if (isDeleteConfirmed ?? false) {
                              await Provider.of<ICoachesActorBloc>(
                                context,
                                listen: false,
                              ).delete(coach);
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
      floatingActionButton: const CoachesScreenFabWidget(),
    );
  }
}
