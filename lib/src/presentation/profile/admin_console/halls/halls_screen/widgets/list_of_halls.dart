import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/halls/actor_bloc/i_hall_actor_bloc.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/hall_form_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/presentation/common/delete_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/hall_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/common/slidable_delete_icon.dart';
import 'package:sports_complex_app/src/presentation/common/slidable_edit_icon.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/hall_form.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/hall_form_inh_widget.dart';

class ListOfHalls extends StatelessWidget {
  const ListOfHalls({
    required this.halls,
    Key? key,
  }) : super(key: key);

  final List<Hall> halls;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: halls.length,
      itemBuilder: (_, index) {
        final hall = halls[index];
        return Slidable(
          actionPane: const SlidableScrollActionPane(),
          secondaryActions: <Widget>[
            SlidableEditIcon(
              onTap: () async {
                // TODO: old navigation
                await Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => HallFormInhWidget(
                      hallFormBloc: HallFormBloc.forEditing(hall),
                      child: const HallForm(),
                    ),
                  ),
                );
              },
            ),
            SlidableDeleteIcon(
              onTap: () async {
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
                  await getIt<IHallsActorBloc>().delete(hall);
                }
              },
            ),
          ],
          child: HallListTile(
            hall: hall,
            onTap: () async {
              // TODO: old navigation
              await Navigator.push<void>(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => HallFormInhWidget(
                    hallFormBloc: HallFormBloc.forEditing(hall),
                    child: const HallForm(),
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
