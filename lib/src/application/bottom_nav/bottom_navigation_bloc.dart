import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable(
  env: [
    Environment.dev,
    Environment.prod,
    Environment.test,
  ],
)
class BottomNavigationBloc {
  final _selectedIndex = BehaviorSubject<int>()..sink..add(0);

  Stream<int> get selectedIndex => _selectedIndex.stream;

  Function(int) get changeSelectedIndex {
    return _selectedIndex.sink.add;
  }

  Future<void> dispose() async {
    await _selectedIndex.close();
  }
}
