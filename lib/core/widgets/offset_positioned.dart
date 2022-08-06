import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OffsetPositioned extends StatelessWidget {
  const OffsetPositioned({
    Key? key,
    required this.child,
    required this.offset,
  }) : super(key: key);

  final Widget child;

  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: child,
    );
  }
}
