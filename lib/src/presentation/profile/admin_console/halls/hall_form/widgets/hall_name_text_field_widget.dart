import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';

class HallNameTextField extends StatelessWidget {
  const HallNameTextField({
    required this.formBloc,
    Key? key,
  }) : super(key: key);

  final IHallFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: formBloc.hallName,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: formBloc.obj?.name,
          keyboardType: TextInputType.name,
          onChanged: formBloc.changeHallName,
          decoration: InputDecoration(
            labelText: S.current.hall_form_hall_name_label_text,
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String?,
            errorMaxLines: 3,
          ),
        );
      },
    );
  }
}
