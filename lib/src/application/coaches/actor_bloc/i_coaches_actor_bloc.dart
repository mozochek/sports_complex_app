import 'package:sports_complex_app/src/application/core/i_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/core/repositories/i_cud_repository.dart';

abstract class ICoachesActorBloc extends IActorBloc<Coach> {
  ICoachesActorBloc(ICudRepository<Coach> repository) : super(repository);
}
