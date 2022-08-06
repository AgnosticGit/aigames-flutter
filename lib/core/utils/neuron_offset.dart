import 'package:flutter/material.dart';

class NeuronOffset extends Offset {
  const NeuronOffset(
    super.dx,
    super.dy,
    this.neuronDiameter,
  );

  final double neuronDiameter;

  Offset leftCenter() => Offset(dx, dy + (neuronDiameter / 2));

  Offset rightCenter() => Offset(
        dx + neuronDiameter,
        dy + (neuronDiameter / 2),
      );

  Offset topCenter() => Offset(dx + (neuronDiameter / 2), dy);

  Offset bottomCenter() => Offset(
        dx + (neuronDiameter / 2),
        dy + neuronDiameter,
      );
}
