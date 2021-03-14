import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/presentation/common/debug_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/widgets/hall_name_text_field_widget.dart';

class HallForm extends StatelessWidget {
  const HallForm({
    Key? key,
    this.editedHall,
  }) : super(key: key);

  final Hall? editedHall;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IHallFormBloc>(context);

    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text(S.current.hall_form_title),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: bloc.isObjValidStream,
            builder: (_, snapshot) {
              final isHallValid = snapshot.data ?? false;
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: isHallValid
                    ? () async {
                        final isSaved = await bloc.saveObj();
                        if (isSaved) {
                          Navigator.of(context).pop();
                        } else {
                          // TODO: debug
                          await showDialog<void>(
                            context: context,
                            builder: (_) => const DebugDialog(
                              content: 'Я не добавил твой сраный зал',
                            ),
                          );
                        }
                      }
                    : null,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: const <Widget>[
            HallNameTextField(),
          ],
        ),
      ),
    );
  }
}
