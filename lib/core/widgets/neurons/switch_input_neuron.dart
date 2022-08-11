import 'package:aigames_flutter/core/style/svg_icons.dart';
import 'package:aigames_flutter/core/widgets/neurons/neuron_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SwitchInputNeuron extends StatelessWidget {
  const SwitchInputNeuron({
    Key? key,
    required this.onDecrease,
    required this.onIncrease,
    this.diameter = 100.0,
    this.upLimit = 1.0,
    this.downLimit = 0.0,
    this.rate = 1,
    this.style,
    this.value = 0.0,
    this.fractionDigits = 0,
  }) : super(key: key);

  final double diameter;

  final double upLimit;
  final double downLimit;

  final double rate;

  final double value;

  final TextStyle? style;

  final int fractionDigits;

  final Function() onIncrease;

  final Function() onDecrease;

  @override
  Widget build(BuildContext context) {
    return NeuronCard(
      diameter: diameter,
      child: Column(
        children: [
          Expanded(
            child: Material(
              child: InkWell(
                onTap: onIncrease,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  child: SVGIcons(
                    width: diameter / 2,
                    height: diameter / 2,
                  ).arrowTop,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              value.toStringAsFixed(fractionDigits),
              style: style,
            ),
          ),
          Expanded(
            child: Material(
              child: InkWell(
                onTap: onDecrease,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  child: Transform.rotate(
                    angle: -math.pi,
                    child: SVGIcons(
                      width: diameter / 2,
                      height: diameter / 2,
                    ).arrowTop,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
