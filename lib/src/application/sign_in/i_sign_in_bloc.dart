typedef ChangeEmail = void Function(String);

typedef ChangePassword = void Function(String);

abstract class ISignInBloc {
  /// Stream of email values
  Stream<String> get email;

  /// Email change function
  ChangeEmail get changeEmail;

  /// Stream of password values
  Stream<String> get password;

  /// Password change function
  ChangePassword get changePassword;

  /// Stream of [bool] for UI responsiveness
  ///
  /// Emits values depending on the correctness of sign in data
  Stream<bool> get isSignInAllowed;

  /// Method which called on user sign in
  Future<void> signIn();

  /// Dispose of all possible resources
  Future<void> dispose();
}
