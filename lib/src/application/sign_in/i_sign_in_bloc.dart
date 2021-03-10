typedef ChangeEmail = void Function(String);

typedef ChangePassword = void Function(String);

// TODO: doc
abstract class ISignInBloc {
  Stream<String> get email;

  ChangeEmail get changeEmail;

  Stream<String> get password;

  ChangePassword get changePassword;

  /// Stream of [bool] for UI responsiveness
  ///
  /// Emits values depending on the correctness of sign in data
  Stream<bool> get isSignInAllowed;

  // TODO: to Future<void>
  Future<bool> signIn();

  Future<void> dispose();
}
