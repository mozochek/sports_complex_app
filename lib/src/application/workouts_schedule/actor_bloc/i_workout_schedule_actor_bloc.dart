import 'package:sports_complex_app/src/application/core/i_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/core/repositories/i_cud_repository.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

abstract class IWorkoutScheduleActorBloc extends IActorBloc<Workout> {
  IWorkoutScheduleActorBloc(ICudRepository<Workout> repository)
      : super(repository);
}
