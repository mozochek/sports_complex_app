import 'package:sports_complex_app/src/domain/core/repositories/i_cud_repository.dart';

part 'form_bloc_purpose.dart';

/// Abstract class that describes the default behaviour for any BLoC on any form screen
abstract class IFormBloc<T> {
  IFormBloc({
    required this.repository,
    this.obj,
    this.purpose,
  });

  /// Instance of repository
  final ICudRepository<T> repository;

  /// Function for creating object from all entered data
  ///
  /// As default used in [create()] function
  final T? obj;

  /// This bloc purpose
  final FormBlocPurpose? purpose;

  /// Stream of [bool] for UI responsiveness
  ///
  /// Emits values depending on the correctness of the entered data
  Stream<bool> get isObjValidStream;

  /// Current state of correctness of the entered data
  bool get isObjValid;

  /// Function for saving entered data
  ///
  /// Calls [createObj()] to create object which will be saved via [repository]
  Future<bool> saveObj() {
    if (!isObjValid) {
      return Future<bool>(() => false);
    }
    return Future<bool>(
      () async {
        bool isSaved = true;
        switch (purpose) {
          case FormBlocPurpose.editing:
            {
              await repository.update(obj!).catchError(
                    (dynamic e) => isSaved = false,
                  );
              break;
            }
          case FormBlocPurpose.creating:
          default:
            {
              await repository.create(obj!).catchError(
                    (dynamic e) => isSaved = false,
                  );
              break;
            }
        }
        return isSaved;
      },
    );
  }

  /// Dispose of all possible resources
  Future<void> dispose();
}
