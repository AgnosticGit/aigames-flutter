import 'package:aigames_flutter/core/navigation/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => AutoRouter.of(context).push(const PerceptronRoute()),
          child: Text('Perceptron'),
        ),
      ),
    );
  }
}
