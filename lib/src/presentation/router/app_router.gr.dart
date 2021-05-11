// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../bottom_nav/bottom_navigation_widget.dart' as _i6;
import '../profile/admin_console/admin_console_screen.dart' as _i7;
import '../profile/admin_console/news/news_form/news_form.dart' as _i8;
import '../sign_in/sign_in_screen.dart' as _i4;
import '../sign_up/sign_up_screen.dart' as _i5;
import '../welcome/welcome_screen.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WelcomeScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<void>(
          routeData: routeData, child: const _i3.WelcomeScreen());
    },
    SignInScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<void>(
          routeData: routeData, child: const _i4.SignInScreen());
    },
    SignUpScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<void>(
          routeData: routeData, child: const _i5.SignUpScreen());
    },
    BottomNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<BottomNavigationRouteArgs>(
          orElse: () => const BottomNavigationRouteArgs());
      return _i1.MaterialPageX<void>(
          routeData: routeData, child: _i6.BottomNavigation(key: args.key));
    },
    AdminConsoleScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<void>(
          routeData: routeData, child: const _i7.AdminConsoleScreen());
    },
    NewsFormRoute.name: (routeData) {
      return _i1.MaterialPageX<void>(
          routeData: routeData,
          child: const _i8.NewsForm(),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(WelcomeScreenRoute.name, path: '/'),
        _i1.RouteConfig(SignInScreenRoute.name, path: '/sign-in-screen'),
        _i1.RouteConfig(SignUpScreenRoute.name, path: '/sign-up-screen'),
        _i1.RouteConfig(BottomNavigationRoute.name, path: '/bottom-navigation'),
        _i1.RouteConfig(AdminConsoleScreenRoute.name,
            path: '/admin-console-screen'),
        _i1.RouteConfig(NewsFormRoute.name, path: '/news-form')
      ];
}

class WelcomeScreenRoute extends _i1.PageRouteInfo {
  const WelcomeScreenRoute() : super(name, path: '/');

  static const String name = 'WelcomeScreenRoute';
}

class SignInScreenRoute extends _i1.PageRouteInfo {
  const SignInScreenRoute() : super(name, path: '/sign-in-screen');

  static const String name = 'SignInScreenRoute';
}

class SignUpScreenRoute extends _i1.PageRouteInfo {
  const SignUpScreenRoute() : super(name, path: '/sign-up-screen');

  static const String name = 'SignUpScreenRoute';
}

class BottomNavigationRoute
    extends _i1.PageRouteInfo<BottomNavigationRouteArgs> {
  BottomNavigationRoute({_i2.Key? key})
      : super(name,
            path: '/bottom-navigation',
            args: BottomNavigationRouteArgs(key: key));

  static const String name = 'BottomNavigationRoute';
}

class BottomNavigationRouteArgs {
  const BottomNavigationRouteArgs({this.key});

  final _i2.Key? key;
}

class AdminConsoleScreenRoute extends _i1.PageRouteInfo {
  const AdminConsoleScreenRoute() : super(name, path: '/admin-console-screen');

  static const String name = 'AdminConsoleScreenRoute';
}

class NewsFormRoute extends _i1.PageRouteInfo {
  const NewsFormRoute() : super(name, path: '/news-form');

  static const String name = 'NewsFormRoute';
}
