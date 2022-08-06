import 'package:aigames_flutter/core/style/svg_icons.dart';
import 'package:aigames_flutter/core/widgets/neurons/neuron_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SwitchInputNeuron extends StatefulWidget {
  const SwitchInputNeuron({
    Key? key,
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

  @override
  State<SwitchInputNeuron> createState() => _SwitchInputNeuronState();
}

class _SwitchInputNeuronState extends State<SwitchInputNeuron> {
  late TextStyle style;
  late double value;

  @override
  void initState() {
    value = widget.value;

    if (widget.style == null) {
      style = TextStyle(fontSize: widget.diameter * 0.17);
    } else {
      style = widget.style!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NeuronCard(
      diameter: widget.diameter,
      child: Column(
        children: [
          Expanded(
            child: Material(
              child: InkWell(
                onTap: increase,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  child: SVGIcons(
                    width: widget.diameter / 2,
                    height: widget.diameter / 2,
                  ).arrowTop,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              value.toStringAsFixed(widget.fractionDigits),
              style: style,
            ),
          ),
          Expanded(
            child: Material(
              child: InkWell(
                onTap: decrease,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  child: Transform.rotate(
                    angle: -math.pi,
                    child: SVGIcons(
                      width: widget.diameter / 2,
                      height: widget.diameter / 2,
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

  void increase() {
    if (value <= widget.upLimit) {
      value = (value + widget.rate);
      if (value > widget.upLimit) value = widget.upLimit;
      setState(() {});
    }
  }

  void decrease() {
    if (value >= widget.downLimit) {
      value -= widget.rate;
      if (value < widget.downLimit) value = widget.downLimit;
      setState(() {});
    }
  }
}
