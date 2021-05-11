import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/workout_form_bloc.dart';

import 'package:sports_complex_app/src/presentation/colors.dart';
import 'package:sports_complex_app/src/presentation/workouts/widgets/workouts_fab_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/workout_form.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/workout_form_inh_widget.dart';

class AnimatedFabWrapper extends StatelessWidget {
  const AnimatedFabWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer<void>(
      openBuilder: (_, value) => WorkoutFormInhWidget(
        workoutFormBloc: WorkoutFormBloc.forCreating(),
        child: const WorkoutForm(),
      ),
      closedShape: Theme.of(context).floatingActionButtonTheme.shape ??
          const CircleBorder(),
      closedColor:
          Theme.of(context).floatingActionButtonTheme.backgroundColor ??
              AppColors.blue,
      closedBuilder: (_, action) => WorkoutsFab(onTap: action),
    );
  }
}
