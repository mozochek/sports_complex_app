import 'package:injectable/injectable.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/actor_bloc/i_workout_schedule_actor_bloc.dart';

import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart';

@LazySingleton(
  as: IWorkoutScheduleActorBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class WorkoutScheduleActorBloc extends IWorkoutScheduleActorBloc {
  WorkoutScheduleActorBloc(IWorkoutsFirestoreCrudRepository repository)
      : super(repository);
}
