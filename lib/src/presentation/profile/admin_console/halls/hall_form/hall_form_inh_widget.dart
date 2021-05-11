import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';

class HallFormInhWidget extends InheritedWidget {
  const HallFormInhWidget({
    required this.hallFormBloc,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final IHallFormBloc hallFormBloc;

  @override
  bool updateShouldNotify(HallFormInhWidget oldWidget) {
    return oldWidget != this;
  }

  static HallFormInhWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HallFormInhWidget>();
  }

  Future<void> dispose() async {
    await hallFormBloc.dispose();
  }
}
