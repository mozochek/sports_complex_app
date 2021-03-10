import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';

class CoachNameTextField extends StatelessWidget {
  const CoachNameTextField({
    Key key,
    this.initialValue,
  }) : super(key: key);

  final String initialValue;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ICoachFormBloc>(context);

    return StreamBuilder<String>(
      stream: bloc.coachName,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: initialValue,
          keyboardType: TextInputType.name,
          onChanged: bloc.changeCoachName,
          decoration: InputDecoration(
            // TODO: add localization
          labelText: 'Имя',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String,
            errorMaxLines: 3,
          ),
        );
      },
    );
  }
}