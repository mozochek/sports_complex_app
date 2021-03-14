import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/infrastructure/core/exceptions/user_repository_exception.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/string_x.dart';

@Injectable(
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class UserRepository {
  UserRepository(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  Future<void> saveUser(User user) async {
    if (user.authData.email.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidEmail);
    }
    // TODO: improve validation
    if (user.additionalInfo.surname.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidUserSurname);
    }
    // TODO: improve validation
    if (user.additionalInfo.name.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidUserName);
    }

    // TODO: replace with toJson()
    await _firebaseFirestore.collection('users').doc(user.authData.email).set(
      <String, String?>{
        'surname': user.additionalInfo.surname,
        'name': user.additionalInfo.name,
        'role': user.role.asString,
      },
    );
  }

  Future<User> getUser(UserAuthData authData) async {
    final userDoc =
        await _firebaseFirestore.collection('users').doc(authData.email).get();
    final userAsJson = userDoc.data() ?? <String, dynamic>{};
    // TODO: improve data validation
    if (userAsJson.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.userDataIsEmpty);
    }

    return User.fromData(
      authData: authData,
      additionalInfo: UserAdditionalInfo.fromJson(userAsJson),
      role: (userAsJson['role'] as String).asUserRole,
    );
  }
}
