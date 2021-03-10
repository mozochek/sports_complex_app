typedef ChangeEmail = void Function(String);

typedef ChangePassword = void Function(String);

typedef ChangeSurname = void Function(String);

typedef ChangeName = void Function(String);

abstract class ISignUpBloc {
  /// Stream of email value
  Stream<String> get email;

  /// Email change function
  ChangeEmail get changeEmail;

  /// Stream of password value
  Stream<String> get password;

  /// Password change function
  ChangePassword get changePassword;

  /// Stream of user surname value
  Stream<String> get userSurname;

  /// User surname change function
  ChangeSurname get changeSurname;

  /// Stream of user name value
  Stream<String> get userName;

  /// User name change function
  ChangeName get changeName;

  /// Stream of [bool] for UI responsiveness
  ///
  /// Emits values depending on the correctness of sign up data
  Stream<bool> get isSignUpAllowed;

  /// Method which called when user want to sign up
  Future<void> signUp();

  /// Dispose of all possible resources
  Future<void> dispose();
}
