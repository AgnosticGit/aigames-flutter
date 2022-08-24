// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../pages/gradient_descent_page.dart' as _i3;
import '../../pages/main_page.dart' as _i1;
import '../../pages/perceptron_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    PerceptronRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PerceptronPage());
    },
    GradientDescentRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.GradientDescentPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MainRoute.name, path: '/'),
        _i4.RouteConfig(PerceptronRoute.name, path: '/perceptron'),
        _i4.RouteConfig(GradientDescentRoute.name, path: '/gradient_descent')
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.PerceptronPage]
class PerceptronRoute extends _i4.PageRouteInfo<void> {
  const PerceptronRoute() : super(PerceptronRoute.name, path: '/perceptron');

  static const String name = 'PerceptronRoute';
}

/// generated route for
/// [_i3.GradientDescentPage]
class GradientDescentRoute extends _i4.PageRouteInfo<void> {
  const GradientDescentRoute()
      : super(GradientDescentRoute.name, path: '/gradient_descent');

  static const String name = 'GradientDescentRoute';
}
