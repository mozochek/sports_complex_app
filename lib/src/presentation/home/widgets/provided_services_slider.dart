import 'package:flutter/material.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/provided_services/watcher_bloc/i_provided_services_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/provided_service/provided_service.dart';

class ProvidedServicesSlider extends StatefulWidget {
  const ProvidedServicesSlider({
    Key? key,
  }) : super(key: key);

  @override
  _ProvidedServicesSliderState createState() => _ProvidedServicesSliderState();
}

class _ProvidedServicesSliderState extends State<ProvidedServicesSlider> {
  late final IProvidedServicesWatcherBloc _bloc;
  late final List<ProvidedService> _providedServices;

  @override
  void initState() {
    _bloc = getIt<IProvidedServicesWatcherBloc>();
    _providedServices = _bloc.getProvidedServices();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          for (final service in _providedServices)
            Card(
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 150.0,
                  height: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          service.name,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${service.price} р.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
