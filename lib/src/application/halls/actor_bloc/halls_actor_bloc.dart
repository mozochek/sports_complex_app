import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/halls/actor_bloc/i_hall_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart';

@LazySingleton(
  as: IHallsActorBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class HallsActorBloc extends IHallsActorBloc {
  HallsActorBloc(IHallsFirestoreCrudRepository repository) : super(repository);
}
