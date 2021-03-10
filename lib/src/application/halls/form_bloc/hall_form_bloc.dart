import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';

import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';

// ignore_for_file: comment_references

/// Implementation of [IHallFormBloc] interface for managing entered data on the [HallForm] screen
@Injectable(
  as: IHallFormBloc,
  env: [Environment.dev, Environment.prod],
)
// TODO: REFACTOR LIKE IN SIGN/SIGN UP BLOC'S
class HallFormBloc extends IHallFormBloc {
  HallFormBloc(
    IHallsFirestoreCrudRepository repository, {
    @factoryParam this.hall,
    @factoryParam FormBlocPurpose purpose = FormBlocPurpose.creating,
  }) : super(repository, hall, purpose);

  factory HallFormBloc.forCreating() => getIt<IHallFormBloc>(
        param1: Hall.empty(),
        param2: FormBlocPurpose.creating,
      ) as HallFormBloc;

  factory HallFormBloc.forEditing(Hall hall) {
    final bloc = getIt<IHallFormBloc>(
      param1: hall.copy(),
      param2: FormBlocPurpose.editing,
    ) as HallFormBloc;

    bloc.changeHallName(hall.name);

    return bloc;
  }

  final Hall hall;

  /// [BehaviorSubject] represents [name] field of [Hall] object
  final _hallName = BehaviorSubject<String>();

  /// [BehaviorSubject] represents the correctness of all entered data
  final _isValid = BehaviorSubject<bool>()..value = false;

  @override
  Stream<String> get hallName => _hallName.stream.transform(_validateHallName);

  // TODO: create validator mixin? HallValidatorMixin with this method
  /// Validator for [_hallName]
  StreamTransformer<String, String> get _validateHallName =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawHallName, sink) {
          final hallName = rawHallName.trim();
          if (hallName.length > 2) {
            hall.name = hallName;
            _isValid.sink.add(true);
            sink.add(hallName);
          } else {
            _isValid.sink.add(false);
            // TODO: add locale for error
            // TODO: add error sending via error object
            sink.addError('Название должно состоять из 3 или более символов');
          }
        },
      );

  @override
  Function(String) get changeHallName => _hallName.sink.add;

  @override
  bool get isObjValid => _isValid.value;

  @override
  Stream<bool> get isObjValidStream => _isValid.stream;

  @override
  Future<void> dispose() async {
    await _hallName.close();
    await _isValid.close();
  }
}
