import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/presentation/common/debug_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_coach_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_date_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_end_time_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_hall_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_name_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_start_time_text_field_widget.dart';

class WorkoutForm extends StatelessWidget {
  const WorkoutForm({
    Key? key,
    this.editedWorkoutSchedule,
  }) : super(key: key);

  final Workout? editedWorkoutSchedule;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IWorkoutFormBloc>(context);

    return ScaffoldWrapper(
      appBar: AppBar(
        // TODO: add localization
        title: const Text('Добавить расписание'),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: bloc.isObjValidStream,
            builder: (_, snapshot) {
              final isHallValid = snapshot.data ?? false;
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: isHallValid
                    ? () async {
                        final isCreated = await bloc.saveObj();
                        if (isCreated) {
                          Navigator.of(context).pop();
                        } else {
                          // TODO: debug
                          await showDialog<void>(
                            context: context,
                            builder: (_) => const DebugDialog(
                              content: 'Я не добавил твою сраную тренировку',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: const <Widget>[
              WorkoutNameTextField(),
              WorkoutHallTextField(),
              WorkoutCoachTextField(),
              WorkoutDateTextField(),
              WorkoutStartTimeTextField(),
              WorkoutEndTimeTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
