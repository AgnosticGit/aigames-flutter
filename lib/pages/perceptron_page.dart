import 'package:aigames_flutter/core/di/di.dart';
import 'package:aigames_flutter/core/style/texts.dart';
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
  final learnRateController = TextEditingController();
  final epochesController = TextEditingController();

  @override
  void initState() {
    _initPerceptron();
    super.initState();
  }

  Future<void> _initPerceptron() async {
    final perceptron = Di.perceptron;
    await perceptron.getPerceptron();
    learnRateController.text = perceptron.perceptron.learningRate.toString();
    epochesController.text = perceptron.perceptron.epoches.toString();
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
                  header: Texts.learningRate,
                  controller: learnRateController,
                  initialValue: entity.perceptron.learningRate.toString(),
                  onChanged: (v) {
                    double? value = double.tryParse(v);

                    if (value == null) {
                      value ??= 0.0;
                      learnRateController.text = value.toString();
                      learnRateController.selection =
                          TextSelection.fromPosition(
                        TextPosition(offset: learnRateController.text.length),
                      );
                    }

                    entity.setLearningRate(value);
                  },
                ),
                const SizedBox(height: 20.0),
                _buildHeaderedTextField(
                  header: Texts.epoches,
                  controller: epochesController,
                  initialValue: entity.perceptron.epoches.toString(),
                  onChanged: (v) {
                    int? value = int.tryParse(v);

                    if (value == null) {
                      value ??= 1;
                      epochesController.text = value.toString();
                      epochesController.selection = TextSelection.fromPosition(
                        TextPosition(offset: epochesController.text.length),
                      );
                    }

                    entity.setEpoches(value);
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: entity.tryPerceptron,
                        child: const Text(Texts.tryRequest),
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    SizedBox(
                      width: 120,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: entity.trainPerceptron,
                        child: const Text(Texts.train),
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    SizedBox(
                      width: 120,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: () {
                          epochesController.text = '1';
                          learnRateController.text = '0.1';
                          entity.resetPerceptron();
                        },
                        child: const Text(Texts.reset),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderedTextField({
    required String header,
    required String initialValue,
    required Function(String) onChanged,
    required TextEditingController controller,
  }) {
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
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: InputBorder.none),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
              ],
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
