import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NonEmptyTextField extends StatefulWidget {
  const NonEmptyTextField({
    Key? key,
    this.initialValue = '0.0',
    this.controller,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  final String initialValue;

  final TextEditingController? controller;

  final List<TextInputFormatter>? inputFormatters;

  final Function(String)? onChanged;

  @override
  State<NonEmptyTextField> createState() => _NonEmptyTextFieldState();
}

class _NonEmptyTextFieldState extends State<NonEmptyTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    if (widget.controller == null) {
      controller = TextEditingController();
    } else {
      controller = widget.controller!;
    }

    controller.text = widget.initialValue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && controller.text.isEmpty) {
          controller.text = widget.initialValue;
          widget.onChanged?.call(widget.initialValue);
          setState(() {});
        }
      },
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: widget.inputFormatters,
        textAlign: TextAlign.center,
        // initialValue: entity.perceptron.learningRate.toString(),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
