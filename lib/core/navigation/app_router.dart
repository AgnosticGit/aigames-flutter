import 'package:aigames_flutter/pages/gradient_descent_page.dart';
import 'package:aigames_flutter/pages/main_page.dart';
import 'package:aigames_flutter/pages/perceptron_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(page: PerceptronPage, path: '/perceptron'),
    AutoRoute(page: GradientDescentPage, path: '/gradient_descent'),
  ],
)
class $AppRouter {}
