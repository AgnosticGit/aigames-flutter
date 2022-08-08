import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'perceptron_model.g.dart';

@JsonSerializable()
@CopyWith()
class PerceptronModel {
  PerceptronModel({
    required this.w0,
    required this.w1,
    required this.epoches,
    required this.learningRate,
    this.input1,
    this.input2,
  });

  final double w0;
  final double w1;

  final int? input1;
  final int? input2;

  final int epoches;
  final double learningRate;

  factory PerceptronModel.fromJson(Map<String, dynamic> json) =>
      _$PerceptronModelFromJson(json);
}
