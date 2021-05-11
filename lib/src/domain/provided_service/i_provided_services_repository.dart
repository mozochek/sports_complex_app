import 'package:sports_complex_app/src/domain/provided_service/provided_service.dart';

abstract class IProvidedServicesRepository {
  List<ProvidedService> getProvidedServices();
}