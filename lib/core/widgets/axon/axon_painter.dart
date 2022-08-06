import 'package:flutter/material.dart';

class AxonPainter extends CustomPainter {
  AxonPainter({
    required this.start,
    required this.end,
    this.color = Colors.black,
    this.strokeWidth = 5.0,
  });

  final Offset start;
  final Offset end;

  final Color color;

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.clipRect(Offset.zero & size);
    
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
