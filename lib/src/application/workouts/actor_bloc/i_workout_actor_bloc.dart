import 'package:sports_complex_app/src/application/core/i_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/core/repositories/i_cud_repository.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

abstract class IWorkoutActorBloc extends IActorBloc<Workout> {
  IWorkoutActorBloc(ICudRepository<Workout> repository)
      : super(repository);
}
