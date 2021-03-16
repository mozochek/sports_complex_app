import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/coaches/actor_bloc/i_coaches_actor_bloc.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/coach_form_bloc.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/presentation/common/coach_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/common/delete_dialog.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coach_form/coach_form.dart';

class ListOfCoaches extends StatelessWidget {
  const ListOfCoaches({
    required this.coaches,
    Key? key,
  }) : super(key: key);

  final List<Coach> coaches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: coaches.length,
      itemBuilder: (_, index) {
        final coach = coaches[index];
        return Slidable(
          actionPane: const SlidableScrollActionPane(),
          secondaryActions: <Widget>[
            IconSlideAction(
              icon: Icons.edit,
              color: Colors.yellow,
              onTap: () async {
                // TODO: old navigation
                await Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => Provider<ICoachFormBloc>(
                      create: (_) => CoachFormBloc.forEditing(coach),
                      dispose: (_, bloc) async => bloc.dispose(),
                      child: const CoachForm(),
                    ),
                  ),
                );
              },
            ),
            IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              onTap: () async {
                final isDeleteConfirmed = await showDialog<bool>(
                  context: context,
                  builder: (_) {
                    return DeleteDialog(
                      title: S.current.coach_delete_confirmation_dialog_title,
                      content:
                          S.current.coach_delete_confirmation_dialog_content,
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
            ),
          ],
          child: CoachListTile(
            coach: coach,
            onTap: () async {
              // TODO: old navigation
              await Navigator.of(context).push<void>(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => Provider<ICoachFormBloc>(
                    create: (_) => CoachFormBloc.forEditing(coach),
                    dispose: (_, bloc) async => bloc.dispose(),
                    child: const CoachForm(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
