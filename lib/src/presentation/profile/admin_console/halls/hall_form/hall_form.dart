import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/hall_form_inh_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/widgets/hall_name_text_field_widget.dart';

class HallForm extends StatefulWidget {
  const HallForm({
    Key? key,
  }) : super(key: key);

  @override
  _HallFormState createState() => _HallFormState();
}

class _HallFormState extends State<HallForm> {
  HallFormInhWidget? _inheritedWidget;
  IHallFormBloc? _formBloc;

  @override
  void didChangeDependencies() {
    _inheritedWidget ??= HallFormInhWidget.of(context);
    _formBloc = _inheritedWidget!.hallFormBloc;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _formBloc!.purpose == FormBlocPurpose.creating
            ? Text(S.current.hall_form_title)
            : const Text('Редактировать зал'),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: _formBloc!.isObjValidStream,
            builder: (_, snapshot) {
              final isHallValid = snapshot.data ?? false;
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: isHallValid
                    ? () async {
                        final isSaved = await _formBloc!.saveObj();
                        if (isSaved) {
                          Navigator.of(context).pop();
                        }
                      }
                    : null,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              HallNameTextField(
                formBloc: _formBloc!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
