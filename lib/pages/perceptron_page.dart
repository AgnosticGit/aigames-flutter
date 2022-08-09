import 'package:aigames_flutter/core/di/di.dart';
import 'package:aigames_flutter/core/style/texts.dart';
import 'package:aigames_flutter/views/perceptron_view.dart';
import 'package:flutter/material.dart';

class PerceptronPage extends StatefulWidget {
  const PerceptronPage({Key? key}) : super(key: key);

  @override
  State<PerceptronPage> createState() => _PerceptronPageState();
}

class _PerceptronPageState extends State<PerceptronPage> {
  @override
  void initState() {
    super.initState();
    
    Di.perceptron.getPerceptron();
  }

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
