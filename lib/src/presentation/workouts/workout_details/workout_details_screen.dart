import 'package:flutter/material.dart';

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
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text(workout.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(workout.name),
            Text(workout.coach.fullName),
            Text(workout.hall.name)
          ],
        ),
      ),
    );
  }
}
