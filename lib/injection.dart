import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sports_complex_app/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  asExtension: true,
  preferRelativeImports: false,
)
void configureDependencies(String environment) =>
    getIt.$initGetIt(environment: environment);
