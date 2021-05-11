import 'package:auto_route/annotations.dart';

import 'package:sports_complex_app/src/presentation/bottom_nav/bottom_navigation_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/admin_console_screen.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/news/news_form/news_form.dart';
import 'package:sports_complex_app/src/presentation/sign_in/sign_in_screen.dart';
import 'package:sports_complex_app/src/presentation/sign_up/sign_up_screen.dart';
import 'package:sports_complex_app/src/presentation/welcome/welcome_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute<dynamic>>[
    AutoRoute<void>(page: WelcomeScreen, initial: true),
    AutoRoute<void>(page: SignInScreen),
    AutoRoute<void>(page: SignUpScreen),
    AutoRoute<void>(page: BottomNavigation),
    AutoRoute<void>(page: AdminConsoleScreen),
    AutoRoute<void>(page: NewsForm, fullscreenDialog: true),
  ],
)
class $AppRouter {}
