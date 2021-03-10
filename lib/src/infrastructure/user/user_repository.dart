import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/infrastructure/core/exceptions/user_repository_exception.dart';

@Injectable(
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class UserRepository {
  UserRepository(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  Future<void> saveUserAdditionalInfo(UserData userData) async {
    if (userData.authData.email.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidEmail);
    }
    // TODO: improve validation
    if (userData.additionalInfo.surname.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidUserSurname);
    }
    // TODO: improve validation
    if (userData.additionalInfo.name.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidUserName);
    }

    await _firebaseFirestore
        .collection('users')
        .doc(userData.authData.email)
        .set(
      <String, String>{
        'surname': userData.additionalInfo.surname,
        'name': userData.additionalInfo.name,
      },
    );
  }

  Future<UserAdditionalInfo> getUserAdditionalInfo(
      UserAuthData authData) async {
    final _doc =
        await _firebaseFirestore.collection('users').doc(authData.email).get();
    return UserAdditionalInfo(
      surname: _doc.data()['surname'] as String,
      name: _doc.data()['name'] as String,
    );
  }
}
