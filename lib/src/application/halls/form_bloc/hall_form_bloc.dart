import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';

import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';

/// Implementation of [IHallFormBloc] interface for managing entered data on the HallForm screen
@Injectable(
  as: IHallFormBloc,
  env: [Environment.dev, Environment.prod],
)
class HallFormBloc extends IHallFormBloc with HallFormValidator {
  HallFormBloc(
    IHallsFirestoreCrudRepository repository, {
    @factoryParam Hall? hall,
    @factoryParam FormBlocPurpose? purpose,
  }) : super(repository, hall, purpose = FormBlocPurpose.creating);

  factory HallFormBloc.forCreating() => getIt<IHallFormBloc>(
        param1: Hall.empty(),
        param2: FormBlocPurpose.creating,
      ) as HallFormBloc;

  factory HallFormBloc.forEditing(Hall hall) => getIt<IHallFormBloc>(
        param1: hall.copy(),
        param2: FormBlocPurpose.editing,
      ) as HallFormBloc
        ..changeHallName(hall.name);

  /// [BehaviorSubject] represents name field of [Hall] object
  final _hallName = BehaviorSubject<String>();

  /// [BehaviorSubject] represents the correctness of all entered data
  final _isValid = BehaviorSubject<bool>()..add(false);

  @override
  Stream<String> get hallName => _hallName.stream.transform(_validateHallName);

  /// Validator for [_hallName]
  StreamTransformer<String, String> get _validateHallName =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawHallName, sink) {
          final hallName = rawHallName.trim();
          _isValid.sink.add(true);
          obj!.name = hallName;
          sink.add(hallName);
          if (!isHallNameCorrect(hallName)) {
            _isValid.sink.add(false);
            // TODO: add locale for error
            sink.addError('Название должно состоять из 3 или более символов');
          }
        },
      );

  @override
  void changeHallName(String? hallName) => _hallName.sink.add(hallName ?? '');

  @override
  bool get isObjValid => _isValid.value ?? false;

  @override
  Stream<bool> get isObjValidStream => _isValid.stream;

  @override
  Future<void> dispose() async {
    await _hallName.close();
    await _isValid.close();
  }
}

mixin HallFormValidator {
  bool isHallNameCorrect(String hallName) => hallName.length > 2;
}
