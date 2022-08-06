import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeuronCard extends StatelessWidget {
  const NeuronCard({
    Key? key,
    required this.child,
    this.diameter = 100.0,
  }) : super(key: key);

  final double diameter;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(diameter),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(diameter),
        child: child,
      ),
    );
  }
}
