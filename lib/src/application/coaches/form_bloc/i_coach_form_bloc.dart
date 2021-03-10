import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_crud_repository.dart';

abstract class ICoachFormBloc extends IFormBloc<Coach> {
  ICoachFormBloc(
    ICoachesFirestoreCrudRepository repository,
    Coach coach,
    FormBlocPurpose purpose,
  ) : super(
          repository: repository,
          obj: coach,
          purpose: purpose,
        );

  /// Get current [Coach] surname
  Stream<String> get coachSurname;

  /// Set [Coach] surname
  Function(String) get changeCoachSurname;

  /// Get current [Coach] name
  Stream<String> get coachName;

  /// Set [Coach] name
  Function(String) get changeCoachName;

  /// Get current [Coach] patronymic
  Stream<String> get coachPatronymic;

  /// Set [Coach] patronymic
  Function(String) get changeCoachPatronymic;
}
