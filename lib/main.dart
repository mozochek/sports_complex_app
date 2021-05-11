import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/theme/app_theme_bloc.dart';
import 'package:sports_complex_app/src/presentation/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  await Hive.initFlutter();
  await Firebase.initializeApp();
  configureDependencies(
    Environment.dev,
  );
  await getIt<AppThemeBloc>().setInitialTheme();
  runApp(Application());
}
