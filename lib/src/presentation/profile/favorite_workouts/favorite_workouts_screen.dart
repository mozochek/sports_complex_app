import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';

class FavoriteWorkoutsScreen extends StatelessWidget {
  const FavoriteWorkoutsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Избранные тренировки'),
      ),
      body: const Center(
        child: Text('Тут будет список выбранных тренировок'),
      ),
    );
  }
}