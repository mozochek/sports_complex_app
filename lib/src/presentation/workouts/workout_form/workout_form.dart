import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_coach_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_date_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_end_time_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_hall_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_name_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/widgets/workout_start_time_text_field_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/workout_form_inh_widget.dart';

class WorkoutForm extends StatefulWidget {
  const WorkoutForm({
    Key? key,
    this.editedWorkout,
  }) : super(key: key);

  final Workout? editedWorkout;

  @override
  _WorkoutFormState createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  WorkoutFormInhWidget? _inheritedWidget;
  IWorkoutFormBloc? _bloc;

  @override
  void didChangeDependencies() {
    _inheritedWidget ??= WorkoutFormInhWidget.of(context);
    _bloc ??= _inheritedWidget!.workoutFormBloc;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: add localization
        title: _bloc!.purpose == FormBlocPurpose.creating
            ? const Text('Добавить расписание')
            : const Text('Редактировать расписание'),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: _bloc!.isObjValidStream,
            builder: (_, snapshot) {
              final isWorkoutValid = snapshot.data ?? false;
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: isWorkoutValid
                    ? () async {
                        final isSaved = await _bloc!.saveObj();
                        if (isSaved) {
                          Navigator.of(context).pop();
                        }
                      }
                    : null,
                // TODO: add behavior if was not added
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: WorkoutNameTextField(
                      formBloc: _bloc!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: WorkoutHallTextField(
                      formBloc: _bloc!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: WorkoutCoachTextField(
                      formBloc: _bloc!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: WorkoutDateTextField(
                      formBloc: _bloc!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: WorkoutStartTimeTextField(
                      formBloc: _bloc!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: WorkoutEndTimeTextField(
                      formBloc: _bloc!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _inheritedWidget?.dispose();

    super.dispose();
  }
}
