import 'package:flutter/material.dart';

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

    return SizedBox(
      width: 630.0,
      height: 430.0,
      child: Stack(
        children: [
          Axon(
            size: const Size.square(double.infinity),
            start: input1Offset.rightCenter(),
            end: outputOffset.leftCenter(),
            weight: 10,
          ),
          Axon(
            size: const Size.square(double.infinity),
            start: input2Offset.rightCenter(),
            end: outputOffset.leftCenter(),
            weight: 30,
          ),
          const OffsetPositioned(
            offset: input1Offset,
            child: SwitchInputNeuron(
              diameter: _neuronDiameter,
            ),
          ),
          const OffsetPositioned(
            offset: input2Offset,
            child: SwitchInputNeuron(diameter: _neuronDiameter),
          ),
          OffsetPositioned(
            offset: outputOffset,
            child: const NeuronCard(
              diameter: _neuronDiameter,
              child: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
