import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/halls/form_bloc/hall_form_bloc.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/halls/hall_form/hall_form.dart';

class HallsScreenFab extends StatelessWidget {
  const HallsScreenFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Provider<IHallFormBloc>(
              create: (_) => HallFormBloc.forCreating(),
              dispose: (_, bloc) => bloc.dispose(),
              child: const HallForm(),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
