part of 'i_sports_complex_router.dart';

enum ScreenRoutes {
  welcome,
  signIn,
  signUp,
  bottomNav,
  adminConsole,
  unknown,
}

extension ScreenRoutesX on ScreenRoutes {
  String get toStringPath {
    switch (this) {
      case ScreenRoutes.welcome:
        return '/';
      case ScreenRoutes.signIn:
        return '/sign_in';
      case ScreenRoutes.signUp:
        return '/sign_up';
      case ScreenRoutes.bottomNav:
        return '/bottom_nav';
      case ScreenRoutes.adminConsole:
        return '/admin_console';
      case ScreenRoutes.unknown:
      default:
        return '/unknown';
    }
  }
}
