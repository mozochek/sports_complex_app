import 'package:flutter/material.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

class WorkoutListTile extends StatelessWidget {
  const WorkoutListTile({
    required this.workout,
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  final Workout workout;
  final Function()? onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(workout.name),
            subtitle: Text(workout.coach.fullName),
            leading: Text(
              '${workout.startTime!.format(context)}\n${workout.endTime!.format(context)}',
            ),
          ),
          const Divider(height: 0.0),
        ],
      ),
    );
  }
}
