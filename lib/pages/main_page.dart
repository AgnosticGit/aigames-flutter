import 'package:aigames_flutter/core/navigation/app_router.gr.dart';
import 'package:aigames_flutter/core/style/texts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => AutoRouter.of(context).push(
                const PerceptronRoute(),
              ),
              child: const Text(Texts.perceptron),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () => AutoRouter.of(context).push(
                const GradientDescentRoute(),
              ),
              child: const Text(Texts.gradientDescent),
            ),
          ],
        ),
      ),
    );
  }
}
