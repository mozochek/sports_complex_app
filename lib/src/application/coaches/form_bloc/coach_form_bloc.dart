import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';

@Injectable(
  as: ICoachFormBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class CoachFormBloc extends ICoachFormBloc with CoachFormValidator {
  CoachFormBloc(
    ICoachesFirestoreCrudRepository repository, {
    @factoryParam Coach? coach,
    @factoryParam FormBlocPurpose? purpose,
  }) : super(repository, coach, purpose = FormBlocPurpose.creating);

  factory CoachFormBloc.forCreating() => getIt<ICoachFormBloc>(
        param1: Coach.empty(),
        param2: FormBlocPurpose.creating,
      ) as CoachFormBloc;

  factory CoachFormBloc.forEditing(Coach coach) => getIt<ICoachFormBloc>(
        param1: coach.copy(),
        param2: FormBlocPurpose.creating,
      ) as CoachFormBloc
        ..changeCoachSurname(coach.surname)
        ..changeCoachName(coach.name)
        ..changeCoachPatronymic(coach.patronymic);

  final _coachSurname = BehaviorSubject<String>();
  final _coachName = BehaviorSubject<String>();
  final _coachPatronymic = BehaviorSubject<String>();

  final _isValid = BehaviorSubject<bool>()..add(false);

  @override
  Stream<String> get coachSurname =>
      _coachSurname.stream.transform(_validateCoachSurname);

  StreamTransformer<String, String> get _validateCoachSurname =>
      StreamTransformer.fromHandlers(
        handleData: (rawCoachSurname, sink) {
          final coachSurname = rawCoachSurname.trim();
          obj!.surname = coachSurname;
          sink.add(coachSurname);
          if (!isCoachSurnameCorrect(coachSurname)) {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Фамилия должна состоять из 2 или более символов');
          }
        },
      );

  @override
  void changeCoachSurname(String? coachSurname) =>
      _coachSurname.sink.add(coachSurname ?? '');

  @override
  Stream<String> get coachName =>
      _coachName.stream.transform(_validateCoachName);

  StreamTransformer<String, String> get _validateCoachName =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawCoachName, sink) {
          final coachName = rawCoachName.trim();
          obj!.name = coachName;
          sink.add(coachName);
          if (!isCoachNameCorrect(coachName)) {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Имя должно состоять из 2 или более символов');
          }
        },
      );

  @override
  void changeCoachName(String? coachName) =>
      _coachName.sink.add(coachName ?? '');

  @override
  Stream<String> get coachPatronymic =>
      _coachPatronymic.stream.transform(_validateCoachPatronymic);

  StreamTransformer<String, String> get _validateCoachPatronymic =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawCoachPatronymic, sink) {
          final coachPatronymic = rawCoachPatronymic.trim();
          obj!.patronymic = coachPatronymic;
          sink.add(coachPatronymic);
          if (!isCoachPatronymicCorrect(coachPatronymic)) {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Отчество должно состоять из 2 или более символов');
          }
        },
      );

  @override
  void changeCoachPatronymic(String? coachPatronymic) =>
      _coachPatronymic.sink.add(coachPatronymic ?? '');

  @override
  bool get isObjValid => _isValid.value ?? false;

  @override
  Stream<bool> get isObjValidStream =>
      Rx.combineLatest3<String, String, String, bool>(
        coachSurname,
        coachName,
        coachPatronymic,
        (a, b, c) {
          final isValid = isCoachSurnameCorrect(a) &&
              isCoachNameCorrect(b) &&
              isCoachPatronymicCorrect(c);
          _isValid.sink.add(isValid);
          return _isValid.value ?? false;
        },
      );

  @override
  Future<void> dispose() async {
    await _coachSurname.close();
    await _coachName.close();
    await _coachPatronymic.close();
    await _isValid.close();
  }
}

mixin CoachFormValidator {
  bool isCoachSurnameCorrect(String coachSurname) => coachSurname.length > 1;

  bool isCoachNameCorrect(String coachName) => coachName.length > 1;

  bool isCoachPatronymicCorrect(String coachPatronymic) =>
      coachPatronymic.length > 1;
}
