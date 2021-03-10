import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/coaches/actor_bloc/i_coaches_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_crud_repository.dart';

@LazySingleton(
  as: ICoachesActorBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class CoachesActorBloc extends ICoachesActorBloc {
  CoachesActorBloc(ICoachesFirestoreCrudRepository repository)
      : super(repository);
}
