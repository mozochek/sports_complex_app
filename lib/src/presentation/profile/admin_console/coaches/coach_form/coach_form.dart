import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/debug_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coach_form/widgets/coach_name_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coach_form/widgets/coach_patronymic_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coach_form/widgets/coach_surname_text_field_widget.dart';

class CoachForm extends StatelessWidget {
  const CoachForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ICoachFormBloc>(context);

    return ScaffoldWrapper(
      appBar: AppBar(
        // TODO: add localization
        title: const Text('Добавить тренера'),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: bloc.isObjValidStream,
            builder: (_, snapshot) {
              final isCoachValid = snapshot.data ?? false;
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: isCoachValid
                    ? () async {
                        final isSaved = await bloc.saveObj();
                        if (isSaved) {
                          Navigator.of(context).pop();
                        } else {
                          // TODO: debug
                          await showDialog<void>(
                            context: context,
                            builder: (_) => const DebugDialog(
                              content: 'Я не добавил твоего сраного тренера',
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
            CoachSurnameTextField(),
            CoachNameTextField(),
            CoachPatronymicTextField(),
          ],
        ),
      ),
    );
  }
}
