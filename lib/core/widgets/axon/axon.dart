import 'package:flutter/material.dart';
import 'axon_painter.dart';

class Axon extends StatelessWidget {
  const Axon({
    Key? key,
    required this.start,
    required this.end,
    required this.size,
    this.color = Colors.black,
    this.strokeWidth = 5.0,
    this.weight,
  }) : super(key: key);

  final Size size;

  final Offset start;
  final Offset end;

  final Color color;

  final double strokeWidth;

  final double? weight;

  static const double _offsetOfWeightDy = 0.0;
  static const double _offsetOfWeightDx = 30.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: size,
          painter: AxonPainter(
            start: start,
            end: end,
            color: color,
            strokeWidth: strokeWidth,
          ),
        ),
        _buildWeight(),
      ],
    );
  }

  Widget _buildWeight() {
    if (weight == null) return const SizedBox();

    return Positioned(
      left: _calculateDx(),
      top: _calculateDy(),
      child: Text(weight.toString()),
    );
  }

  double _calculateDx() {
    return (end - start).dx / 2 + start.dx ;
  }

  double _calculateDy() {
    if (end.dy > start.dy) {
      return (end - start).dy / 2 + start.dy - _offsetOfWeightDy;
    }

    return (start - end).dy / 2 + end.dy - _offsetOfWeightDy;
  }
}
