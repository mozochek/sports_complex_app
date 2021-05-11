import 'package:injectable/injectable.dart';
import 'package:sports_complex_app/src/domain/provided_service/i_provided_services_repository.dart';
import 'package:sports_complex_app/src/domain/provided_service/provided_service.dart';

@Injectable(
  as: IProvidedServicesRepository,
  env: <String>[
    Environment.dev,
    Environment.test,
    Environment.prod,
  ],
)
class ProvidedServicesRepository implements IProvidedServicesRepository {
  @override
  List<ProvidedService> getProvidedServices() {
    return <ProvidedService>[
      ProvidedService(
        name: 'Персональная тренировка по плаванию',
        description:
            'Единоразовое персональное занятие с тренером по плаванию.',
        price: 749,
      ),
      ProvidedService(
        name: 'Персональная тренировка по акробатике',
        description:
            'Единоразовое персональное занятие с тренером по акробатике.',
        price: 899,
      ),
      ProvidedService(
        name: 'Создание личного плана тренировок',
        description:
        'Помощь в составлении личного плана тренировок вместе с опытным тренером.',
        price: 1499,
      ),
      ProvidedService(
        name: 'Аренда малого теннисного корта',
        description:
        'Арендуйте малый теннисный корт для личного использования. Почасовая оплата.',
        price: 999,
      ),
    ];
  }
}
