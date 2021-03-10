import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/presentation/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(
    Environment.dev,
  );
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  await Firebase.initializeApp();
  runApp(const Application());
}
