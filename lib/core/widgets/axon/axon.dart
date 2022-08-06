import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'axon_painter.dart';

class Axon extends StatelessWidget {
  const Axon({
    Key? key,
    required this.start,
    required this.end,
    required this.size,
    this.color = Colors.black,
    this.strokeWidth = 5.0,
  }) : super(key: key);

  final Size size;

  final Offset start;
  final Offset end;

  final Color color;

  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      foregroundPainter: AxonPainter(
        start: start,
        end: end,
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
