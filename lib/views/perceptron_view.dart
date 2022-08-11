import 'package:aigames_flutter/core/di/di.dart';
import 'package:aigames_flutter/core/style/texts.dart';
import 'package:aigames_flutter/entities/perceptron_entity.dart';
import 'package:flutter/material.dart';

import '../core/state_manager/app_builder.dart';
import '../core/utils/neuron_offset.dart';
import '../core/widgets/axon/axon.dart';
import '../core/widgets/neurons/neuron_card.dart';
import '../core/widgets/neurons/switch_input_neuron.dart';
import '../core/widgets/offset_positioned.dart';

class PerceptronView extends StatelessWidget {
  const PerceptronView({Key? key}) : super(key: key);

  static const double _neuronDiameter = 100.0;

  @override
  Widget build(BuildContext context) {
    const input1Offset = NeuronOffset(30.0, 30.0, _neuronDiameter);
    const input2Offset = NeuronOffset(30.0, 300.0, _neuronDiameter);
    final centerBetweenInputs = (input1Offset.dy + input2Offset.dy) / 2;
    final outputOffset =
        NeuronOffset(500, centerBetweenInputs, _neuronDiameter);

    return AppBuilder<PerceptronEntity>(
      observable: Di.perceptron,
      builder: (entity) {
        return SizedBox(
          width: 630.0,
          height: 430.0,
          child: Stack(
            children: [
              Axon(
                size: const Size.square(double.infinity),
                start: input1Offset.rightCenter(),
                end: outputOffset.leftCenter(),
                weight: entity.perceptron.w0,
              ),
              Axon(
                size: const Size.square(double.infinity),
                start: input2Offset.rightCenter(),
                end: outputOffset.leftCenter(),
                weight: entity.perceptron.w1,
              ),
              OffsetPositioned(
                offset: input1Offset,
                child: SwitchInputNeuron(
                  onIncrease: () {
                    if (entity.perceptron.input1 == 0) entity.setInput1(1);
                  },
                  onDecrease: () {
                    if (entity.perceptron.input1 == 1) entity.setInput1(0);
                  },
                  diameter: _neuronDiameter,
                  value:
                      double.tryParse(entity.perceptron.input1.toString()) ?? 0,
                ),
              ),
              OffsetPositioned(
                offset: input2Offset,
                child: SwitchInputNeuron(
                  onIncrease: () {
                    if (entity.perceptron.input2 == 0) entity.setInput2(1);
                  },
                  onDecrease: () {
                    if (entity.perceptron.input2 == 1) entity.setInput2(0);
                  },
                  diameter: _neuronDiameter,
                  value:
                      double.tryParse(entity.perceptron.input2.toString()) ?? 0,
                ),
              ),
              OffsetPositioned(
                offset: outputOffset,
                child: NeuronCard(
                  diameter: _neuronDiameter,
                  child: Text(
                    entity.perceptron.output == null
                        ? Texts.tryOrTrain
                        : entity.perceptron.output.toString(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
