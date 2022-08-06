import 'package:aigames_flutter/core/style/texts.dart';
import 'package:aigames_flutter/core/utils/neuron_offset.dart';
import 'package:aigames_flutter/core/widgets/axon/axon.dart';
import 'package:aigames_flutter/core/widgets/neuron.dart';
import 'package:aigames_flutter/core/widgets/offset_positioned.dart';
import 'package:flutter/material.dart';

class PerceptronPage extends StatelessWidget {
  const PerceptronPage({Key? key}) : super(key: key);

  static const double neuronDiameter = 100.0;

  @override
  Widget build(BuildContext context) {
    const input1Offset = NeuronOffset(50.0, 50.0, neuronDiameter);
    const input2Offset = NeuronOffset(50.0, 300.0, neuronDiameter);
    final centerBetweenInputs = (input1Offset.dy + input2Offset.dy) / 2;
    final outputOffset = NeuronOffset(500, centerBetweenInputs, neuronDiameter);

    return Scaffold(
      appBar: AppBar(title: const Text(Texts.perceptron)),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const OffsetPositioned(
              offset: input1Offset,
              child: Neuron(diameter: neuronDiameter),
            ),
            const OffsetPositioned(
              offset: input2Offset,
              child: Neuron(diameter: neuronDiameter),
            ),
            OffsetPositioned(
              offset: outputOffset,
              child: const Neuron(diameter: neuronDiameter),
            ),
            Axon(
              size: const Size.square(double.infinity),
              start: input1Offset.rightCenter(),
              end: outputOffset.leftCenter(),
            ),
            Axon(
              size: const Size.square(double.infinity),
              start: input2Offset.rightCenter(),
              end: outputOffset.leftCenter(),
            ),
          ],
        ),
      ),
    );
  }
}
