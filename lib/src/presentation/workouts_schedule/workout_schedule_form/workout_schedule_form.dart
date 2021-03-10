import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/presentation/common/debug_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workout_schedule_form/widgets/workout_schedule_coach_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workout_schedule_form/widgets/workout_schedule_date_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workout_schedule_form/widgets/workout_schedule_end_time_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workout_schedule_form/widgets/workout_schedule_hall_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workout_schedule_form/widgets/workout_schedule_name_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workout_schedule_form/widgets/workout_schedule_start_time_text_field_widget.dart';

class WorkoutScheduleForm extends StatelessWidget {
  const WorkoutScheduleForm({
    Key key,
    this.editedWorkoutSchedule,
  }) : super(key: key);

  final Workout editedWorkoutSchedule;

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
            children: <Widget>[
              WorkoutScheduleNameTextField(
                initialValue: editedWorkoutSchedule?.name,
              ),
              const WorkoutScheduleHallTextField(),
              const WorkoutScheduleCoachTextField(),
              const WorkoutScheduleDateTextField(),
              const WorkoutScheduleStartTimeTextField(),
              const WorkoutScheduleEndTimeTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
