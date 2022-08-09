import 'package:aigames_flutter/core/di/di.dart';
import 'package:aigames_flutter/core/style/texts.dart';
import 'package:aigames_flutter/core/widgets/text_fields/non_empty_text_field.dart';
import 'package:aigames_flutter/entities/entity.dart';
import 'package:aigames_flutter/entities/perceptron_entity.dart';
import 'package:aigames_flutter/views/perceptron_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/state_manager/app_builder.dart';

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
      body: Center(
        child: AppBuilder<PerceptronEntity>(
          observable: Di.perceptron,
          builder: (entity) {
            return Column(
              children: [
                const SizedBox(height: 30.0),
                _buildHeaderedTextField(
                  Texts.learningRate,
                  entity.perceptron.learningRate.toString(),
                  (v) {
                    print(v);
                  },
                ),
                const SizedBox(height: 20.0),
                _buildHeaderedTextField(
                  Texts.epoches,
                  entity.perceptron.epoches.toString(),
                  (v) {},
                ),
                const SizedBox(height: 30.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const PerceptronView(),
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  width: 120,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(Texts.tryRequest),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderedTextField(
    String header,
    String initialValue,
    Function(String) onChanged,
  ) {
    return SizedBox(
      width: 200.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: const TextStyle(fontSize: 20.0),
          ),
          Container(
            alignment: Alignment.center,
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: NonEmptyTextField(
              initialValue: initialValue,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'(^\d*\.?\d*)'),
                )
              ],
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
