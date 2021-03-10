import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_crud_repository.dart';

@LazySingleton(
  as: ICoachesWatcherBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class CoachesWatcherBloc extends ICoachesWatcherBloc {
  CoachesWatcherBloc(ICoachesFirestoreCrudRepository repository)
      : super(repository);
}
