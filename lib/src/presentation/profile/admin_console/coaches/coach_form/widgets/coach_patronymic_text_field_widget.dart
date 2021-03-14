import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';

class CoachPatronymicTextField extends StatelessWidget {
  const CoachPatronymicTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ICoachFormBloc>(context);

    return StreamBuilder<String>(
      stream: bloc.coachPatronymic,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: bloc.obj?.patronymic,
          keyboardType: TextInputType.name,
          onChanged: bloc.changeCoachPatronymic,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Отчество',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String?,
            errorMaxLines: 3,
          ),
        );
      },
    );
  }
}
