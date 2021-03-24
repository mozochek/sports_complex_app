import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/domain/user/auth_data.dart';
import 'package:sports_complex_app/src/domain/user/personal_data.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/role.dart';
import 'package:sports_complex_app/src/infrastructure/core/exceptions/user_repository_exception.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/firebase_firestore_x.dart';
import 'package:sports_complex_app/src/infrastructure/user/i_user_repository.dart';

@Injectable(
  as: IUserRepository,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class UserRepository implements IUserRepository {
  UserRepository(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<User> createUser(PersonalData personalData, AuthData authData) async {
    // TODO: improve validation
    if (authData.email.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidEmail);
    }
    if (personalData.surname.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidUserSurname);
    }
    if (personalData.name.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.invalidUserName);
    }

    final User createdUser = User.createNewFrom(
      personalData: personalData,
      authData: authData,
    );

    await _firebaseFirestore.usersCollection
        .doc(createdUser.authData.email)
        .set(createdUser.toJson());

    return createdUser;
  }

  @override
  Future<User> getUser(AuthData authData) async {
    final userDoc =
        await _firebaseFirestore.usersCollection.doc(authData.email).get();

    final userAsJson = userDoc.data() ?? <String, dynamic>{};

    // TODO: improve data validation
    if (userAsJson.isEmpty) {
      throw UserRepositoryException(UserRepositoryException.userDataIsEmpty);
    }

    return User.fromJson(userAsJson);
  }

  @override
  Future<Stream<User>> userStream(AuthData authData) async =>
      _firebaseFirestore.usersCollection.doc(authData.email).snapshots().map(
            (doc) => User.fromJson(doc.data()!),
          );

  @override
  Future<void> updateUserRole(User user, Role role) async =>
      _firebaseFirestore.usersCollection
          .doc(user.authData.email)
          .update(role.toJson());

  @override
  Stream<List<User>> watchAll() => _firebaseFirestore.usersCollection
      .orderBy('role')
      .snapshots()
      .map((snapshot) => snapshot.docs.map(
            (doc) {
              // TODO: !
              final userAsJson = doc.data() ?? <String, dynamic>{};
              return User.fromJson(userAsJson);
            },
          ).toList());

  @override
  Stream<User> watchUser(User user) => _firebaseFirestore.usersCollection
      .doc(user.authData.email)
      .snapshots()
      .map((doc) => User.fromJson(doc.data()!));
}
