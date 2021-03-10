import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart';

@LazySingleton(
  as: IHallsWatcherBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class HallsWatcherBloc extends IHallsWatcherBloc {
  HallsWatcherBloc(IHallsFirestoreCrudRepository repository)
      : super(repository);
}
