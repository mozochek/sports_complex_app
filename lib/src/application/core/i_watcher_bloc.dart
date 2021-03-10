import 'package:sports_complex_app/src/domain/core/repositories/watcher_mixin.dart';

abstract class IWatcherBloc<T> {
  IWatcherBloc(this._repository);

  final WatcherMixin<T> _repository;

  Stream<List<T>> get streamOfObjects => _repository.watchAll();
}
