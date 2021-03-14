import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';

class HallNameTextField extends StatelessWidget {
  const HallNameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IHallFormBloc>(context);

    return StreamBuilder<String>(
      stream: bloc.hallName,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: bloc.obj?.name,
          keyboardType: TextInputType.name,
          onChanged: bloc.changeHallName,
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
