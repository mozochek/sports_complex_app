import 'package:flutter/material.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/hall_form_bloc.dart';

import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/hall_form.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/hall_form_inh_widget.dart';

class HallsScreenFab extends StatelessWidget {
  const HallsScreenFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push<void>(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => HallFormInhWidget(
              hallFormBloc: HallFormBloc.forCreating(),
              child: const HallForm(),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
