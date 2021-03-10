import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/coach_form_bloc.dart';

import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/coaches/coach_form/coach_form.dart';

class CoachesScreenFabWidget extends StatelessWidget {
  const CoachesScreenFabWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push<dynamic>(
          MaterialPageRoute<dynamic>(
            fullscreenDialog: true,
            builder: (_) => Provider<ICoachFormBloc>(
              create: (_) => CoachFormBloc.forCreating(),
              dispose: (_, bloc) async => bloc.dispose(),
              child: const CoachForm(),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
