import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/date_time_x.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/time_of_day_x.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  const WorkoutDetailsScreen({
    required this.workout,
    Key? key,
  }) : super(key: key);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    final duration = workout.duration;

    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Расписание'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(workout.name),
            Text('Тренер: ${workout.coach.fullName}'),
            Text('Место проведения: ${workout.hall.name}'),
            Text(
              'Время проведения: ${workout.date!.asFormattedString}, ${workout.startTime!.asFormattedString}-${workout.endTime!.asFormattedString}',
            ),
            Chip(
              backgroundColor: Colors.lightBlue,
              label: Text(
                '${duration.hour} ч. ${duration.minute} мин.',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
