import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Neuron extends StatelessWidget {
  const Neuron({
    Key? key,
    this.diameter = 100.0,
  }) : super(key: key);

  final double diameter;

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
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-1]')),
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'From 0 to 1',
        ),
      ),
    );
  }
}
