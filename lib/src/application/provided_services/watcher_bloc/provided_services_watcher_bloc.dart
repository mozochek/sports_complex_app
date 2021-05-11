import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/provided_services/watcher_bloc/i_provided_services_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/provided_service/i_provided_services_repository.dart';
import 'package:sports_complex_app/src/domain/provided_service/provided_service.dart';

@Injectable(
  as: IProvidedServicesWatcherBloc,
  env: <String>[
    Environment.dev,
    Environment.test,
    Environment.prod,
  ],
)
class ProvidedServicesWatcherBloc implements IProvidedServicesWatcherBloc {
  ProvidedServicesWatcherBloc(this._repository);

  final IProvidedServicesRepository _repository;

  @override
  List<ProvidedService> getProvidedServices() =>
      _repository.getProvidedServices();
}
