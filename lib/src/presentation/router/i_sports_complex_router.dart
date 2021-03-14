import 'package:flutter/material.dart';

part 'screen_routes.dart';

abstract class ISportsComplexRouter {
  late GlobalKey<NavigatorState> rootNavigatorKey;

  Future<bool?> back<T extends Object?>({
    T? data,
    bool rootNavigator,
  });

  Future<T?> push<T extends Object?>(ScreenRoutes route);

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    ScreenRoutes route, {
    bool Function(Route<dynamic>)? predicate,
  });
}
