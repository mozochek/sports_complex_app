import 'package:sports_complex_app/src/domain/user/user.dart';

abstract class IUserEditBloc {
  Stream<String> get userSurname;

  Function(String) get changeUserSurname;

  Stream<String> get userName;

  Function(String) get changeUserName;

  Stream<bool> get isUpdatedDataCorrect;

  Future<bool> updatePersonalData(User user);

  Future<void> dispose();
}