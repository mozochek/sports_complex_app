import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';

// TODO: REFACTOR LIKE IN SIGN/SIGN UP BLOC'S
@Injectable(
  as: ICoachFormBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class CoachFormBloc extends ICoachFormBloc {
  CoachFormBloc(
    ICoachesFirestoreCrudRepository repository, {
    @factoryParam this.coach,
    @factoryParam FormBlocPurpose purpose = FormBlocPurpose.creating,
  }) : super(repository, coach, purpose);

  factory CoachFormBloc.forCreating() => getIt<ICoachFormBloc>(
        param1: Coach.empty(),
        param2: FormBlocPurpose.creating,
      ) as CoachFormBloc;

  factory CoachFormBloc.forEditing(Coach coach) {
    final bloc = getIt<ICoachFormBloc>(
      param1: coach,
      param2: FormBlocPurpose.creating,
    ) as CoachFormBloc;

    bloc.changeCoachSurname(coach.surname);
    bloc.changeCoachName(coach.name);
    bloc.changeCoachPatronymic(coach.patronymic);

    return bloc;
  }

  final Coach coach;

  final _coachSurname = BehaviorSubject<String>();
  final _coachName = BehaviorSubject<String>();
  final _coachPatronymic = BehaviorSubject<String>();

  final _isValid = BehaviorSubject<bool>()..value = false;

  @override
  Stream<String> get coachSurname =>
      _coachSurname.stream.transform(_validateCoachSurname);

  StreamTransformer<String, String> get _validateCoachSurname =>
      StreamTransformer.fromHandlers(
        handleData: (rawCoachSurname, sink) {
          final coachSurname = rawCoachSurname.trim();
          if (coachSurname.length > 2) {
            coach.surname = coachSurname;
            sink.add(coachSurname);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Фамилия должна состоять из 3 или более символов');
          }
        },
      );

  @override
  Function(String) get changeCoachSurname => _coachSurname.sink.add;

  @override
  Stream<String> get coachName =>
      _coachName.stream.transform(_validateCoachName);

  StreamTransformer<String, String> get _validateCoachName =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawCoachName, sink) {
          final coachName = rawCoachName.trim();
          if (coachName.length > 2) {
            coach.name = coachName;
            sink.add(coachName);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Имя должно состоять из 3 или более символов');
          }
        },
      );

  @override
  Function(String) get changeCoachName => _coachName.sink.add;

  @override
  Stream<String> get coachPatronymic =>
      _coachPatronymic.stream.transform(_validateCoachPatronymic);

  StreamTransformer<String, String> get _validateCoachPatronymic =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawCoachPatronymic, sink) {
          final coachPatronymic = rawCoachPatronymic.trim();
          if (coachPatronymic.length > 2) {
            coach.patronymic = coachPatronymic;
            sink.add(coachPatronymic);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Отчество должно состоять из 3 или более символов');
          }
        },
      );

  @override
  Function(String) get changeCoachPatronymic => _coachPatronymic.sink.add;

  @override
  bool get isObjValid => _isValid.value;

  @override
  Stream<bool> get isObjValidStream =>
      Rx.combineLatest3<String, String, String, bool>(
        coachSurname,
        coachName,
        coachPatronymic,
        (a, b, c) {
          _isValid.sink.add(true);
          return true;
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
