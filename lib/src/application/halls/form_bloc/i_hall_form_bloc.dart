import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart';

/// Describes specific BLoC behavior on the HallForm screen
abstract class IHallFormBloc extends IFormBloc<Hall> {
  IHallFormBloc(
    IHallsFirestoreCrudRepository repository,
    Hall? hall,
    FormBlocPurpose? purpose,
  ) : super(
          repository: repository,
          obj: hall,
          purpose: purpose,
        );

  /// Get current [Hall] name
  Stream<String> get hallName;

  /// Set [Hall] name
  void changeHallName(String hallName);
}
