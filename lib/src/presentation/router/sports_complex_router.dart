import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/bottom_nav/bottom_navigation_bloc.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart';
import 'package:sports_complex_app/src/presentation/bottom_nav/bottom_navigation_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/admin_console_screen.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';
import 'package:sports_complex_app/src/presentation/sign_in/sign_in_screen.dart';
import 'package:sports_complex_app/src/presentation/sign_up/sign_up_screen.dart';
import 'package:sports_complex_app/src/presentation/welcome/welcome_screen.dart';

@LazySingleton(
  as: ISportsComplexRouter,
  env: [
    Environment.dev,
    Environment.prod,
    Environment.test,
  ],
)
class SportsComplexRouter implements ISportsComplexRouter {
  @override
  GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<bool?> back<T extends Object?>({
    T? data,
    bool rootNavigator = false,
  }) async {
    final rootState = rootNavigatorKey.currentState;
    return rootState?.maybePop<T>(data);
  }

  @override
  Future<T?> push<T extends Object?>(ScreenRoutes route) async {
    final rootState = rootNavigatorKey.currentState!;
    switch (route) {
      case ScreenRoutes.signIn:
        return rootState.push(
          _buildRoute<T>(
            route: route,
            child: Provider<ISignInBloc>(
              create: (_) => getIt<ISignInBloc>(),
              dispose: (_, bloc) async => bloc.dispose(),
              child: const SignInScreen(),
            ),
          ),
        );
      case ScreenRoutes.signUp:
        return rootState.push(
          _buildRoute<T>(
            route: route,
            child: Provider<ISignUpBloc>(
              create: (_) => getIt<ISignUpBloc>(),
              dispose: (_, bloc) async => bloc.dispose(),
              child: const SignUpScreen(),
            ),
          ),
        );
      case ScreenRoutes.adminConsole:
        return rootState.push(
          _buildRoute<T>(
            route: route,
            child: const AdminConsoleScreen(),
          ),
        );
      default:
        return rootState.push(
          _buildRoute<T>(
            route: ScreenRoutes.unknown,
            child: const Scaffold(
              body: Center(
                child: Text('unknown'),
              ),
            ),
          ),
        );
    }
  }

  @override
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    ScreenRoutes route, {
    bool Function(Route<dynamic>)? predicate,
  }) {
    final rootState = rootNavigatorKey.currentState!;

    switch (route) {
      case ScreenRoutes.welcome:
        return rootState.pushAndRemoveUntil(
          _buildRoute<T>(
            route: route,
            child: const WelcomeScreen(),
          ),
          predicate ?? (_) => false,
        );
      case ScreenRoutes.signIn:
        return rootState.pushAndRemoveUntil(
          _buildRoute<T>(
            route: route,
            child: Provider<ISignInBloc>(
              create: (_) => getIt<ISignInBloc>(),
              dispose: (_, bloc) async => bloc.dispose(),
              child: const SignInScreen(),
            ),
          ),
          predicate ?? (_) => false,
        );
      case ScreenRoutes.signUp:
        return rootState.pushAndRemoveUntil(
          _buildRoute<T>(
            route: route,
            child: Provider<ISignUpBloc>(
              create: (_) => getIt<ISignUpBloc>(),
              dispose: (_, bloc) async => bloc.dispose(),
              child: const SignUpScreen(),
            ),
          ),
          predicate ?? (_) => false,
        );
      case ScreenRoutes.bottomNav:
        return rootState.pushAndRemoveUntil(
          _buildRoute<T>(
            route: route,
            child: Provider<BottomNavigationBloc>(
              create: (_) => getIt<BottomNavigationBloc>(),
              dispose: (_, __) async => getIt<BottomNavigationBloc>().dispose(),
              child: BottomNavigation(),
            ),
          ),
          predicate ?? (_) => false,
        );
      default:
        return rootState.pushAndRemoveUntil(
          _buildRoute<T>(
            route: ScreenRoutes.unknown,
            child: const Scaffold(
              body: Center(
                child: Text('unknown'),
              ),
            ),
          ),
          (_) => false,
        );
    }
  }

  Route<T> _buildRoute<T>({
    required ScreenRoutes route,
    required Widget child,
  }) {
    return MaterialPageRoute<T>(
      builder: (_) => child,
      settings: RouteSettings(name: route.toStringPath),
    );
  }
}
