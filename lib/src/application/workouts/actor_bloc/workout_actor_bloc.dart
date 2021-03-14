import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/workouts/actor_bloc/i_workout_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart';

@LazySingleton(
  as: IWorkoutActorBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class WorkoutActorBloc extends IWorkoutActorBloc {
  WorkoutActorBloc(IWorkoutsFirestoreCrudRepository repository)
      : super(repository);
}
