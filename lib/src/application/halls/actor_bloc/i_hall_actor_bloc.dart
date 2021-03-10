import 'package:sports_complex_app/src/application/core/i_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/core/repositories/i_cud_repository.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';

abstract class IHallsActorBloc extends IActorBloc<Hall> {
  IHallsActorBloc(ICudRepository<Hall> repository) : super(repository);
}
