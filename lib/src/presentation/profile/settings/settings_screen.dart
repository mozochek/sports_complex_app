import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: const Center(
        child: Text('Экран с настройками приложения и аккаунта'),
      ),
    );
  }
}
