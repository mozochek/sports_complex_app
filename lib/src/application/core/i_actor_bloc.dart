import 'package:sports_complex_app/src/domain/core/repositories/i_cud_repository.dart';

abstract class IActorBloc<T> {
  IActorBloc(this._repository);

  final ICudRepository<T> _repository;

  Future<void> delete(T obj) => _repository.delete(obj);
}
