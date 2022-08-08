import 'package:aigames_flutter/core/style/texts.dart';
import 'package:aigames_flutter/views/perceptron_view.dart';
import 'package:flutter/material.dart';

class PerceptronPage extends StatelessWidget {
  const PerceptronPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Texts.perceptron)),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: const PerceptronView(),
      ),
    );
  }
}
