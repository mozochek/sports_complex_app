import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/src/application/user/edit_bloc/i_user_edit_bloc.dart';
import 'package:sports_complex_app/src/domain/user/personal_data.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/infrastructure/user/i_user_repository.dart';

@Injectable(
  as: IUserEditBloc,
  env: <String>[
    Environment.dev,
    Environment.test,
    Environment.prod,
  ],
)
class UserEditBloc with PersonalDataValidator implements IUserEditBloc {
  UserEditBloc(this._repository, @factoryParam PersonalData? userPersonalData) {
    _userPersonalData = userPersonalData!.clone();
    changeUserSurname(_userPersonalData!.surname);
    changeUserName(_userPersonalData!.name);
  }

  final IUserRepository _repository;

  final _userSurname = BehaviorSubject<String>();
  final _userName = BehaviorSubject<String>();
  final _isValid = BehaviorSubject<bool>()..add(false);

  late final PersonalData? _userPersonalData;

  @override
  Stream<String> get userSurname =>
      _userSurname.stream.transform(_validateUserSurname);

  StreamTransformer<String, String> get _validateUserSurname =>
      StreamTransformer.fromHandlers(
        handleData: (rawUserSurname, sink) {
          final userSurname = rawUserSurname.trim();
          _userPersonalData!.surname = userSurname;
          sink.add(userSurname);
          if (!isUserSurnameCorrect(userSurname)) {
            // TODO: add localization
            sink.addError('Фамилия должна состоять из 2 или более символов');
          }
        },
      );

  @override
  Function(String) get changeUserSurname => _userSurname.sink.add;

  @override
  Stream<String> get userName => _userName.stream.transform(_validateUserName);

  StreamTransformer<String, String> get _validateUserName =>
      StreamTransformer.fromHandlers(
        handleData: (rawUserName, sink) {
          final userName = rawUserName.trim();
          _userPersonalData!.name = userName;
          sink.add(userName);
          if (!isUserNameCorrect(userName)) {
            // TODO: add localization
            sink.addError('Имя должно состоять из 2 или более символов');
          }
        },
      );

  @override
  Function(String) get changeUserName => _userName.sink.add;

  @override
  Stream<bool> get isUpdatedDataCorrect =>
      Rx.combineLatest2<String, String, bool>(
        userSurname,
        userName,
        (a, b) {
          final isValid = isUserSurnameCorrect(a) && isUserNameCorrect(b);
          _isValid.sink.add(isValid);
          return _isValid.value ?? false;
        },
      );

  @override
  Future<bool> updatePersonalData(User user) => _repository
      .updateUserPersonalData(user, _userPersonalData!)
      .then((value) => true)
      .onError((_, __) => false);

  @override
  Future<void> dispose() async {
    await _userSurname.close();
    await _userName.close();
    await _isValid.close();
  }
}

mixin PersonalDataValidator {
  bool isUserSurnameCorrect(String userSurname) => userSurname.length > 1;

  bool isUserNameCorrect(String userName) => userName.length > 1;
}
