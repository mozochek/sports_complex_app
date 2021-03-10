import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(
  env: [
    Environment.dev,
    Environment.prod,
    Environment.test,
  ],
)
class WorkoutsScheduleDateBloc {
  final _selectedDate = BehaviorSubject<DateTime>();

  Stream<DateTime> get selectedDate => _selectedDate.stream;

  Function(DateTime) get changeSelectedDate => _selectedDate.sink.add;

  Future<void> dispose() async {
    await _selectedDate.close();
  }
}