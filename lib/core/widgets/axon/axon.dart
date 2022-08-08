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
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(weight.toString()),
      ),
    );
  }

  double _calculateDx() {
    final axonCenterDx = start.dx + (end - start).dx / 2;

    return axonCenterDx - 20;
  }

  double _calculateDy() {
    if (end.dy > start.dy) {
      final axonCenterDy = start.dy + (end - start).dy / 2;
      return axonCenterDy-15;
    }

    final axonCenterDy = end.dy + (start - end).dy / 2;
    return axonCenterDy-15;
  }
}
