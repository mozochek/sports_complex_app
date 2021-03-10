import 'package:sports_complex_app/src/domain/core/repositories/watcher_by_date_mixin.dart';

abstract class IWatcherByDateBloc<T> {
  IWatcherByDateBloc(this._repository);

  final WatcherByDateMixin<T> _repository;

  Stream<List<T>> streamOfObjectsByDate(DateTime date) =>
      _repository.watchAllByDate(date);
}
