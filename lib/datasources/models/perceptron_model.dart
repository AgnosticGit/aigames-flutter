import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'perceptron_model.g.dart';

@JsonSerializable()
@CopyWith()
class PerceptronModel {
  PerceptronModel({
    required this.id,
    required this.w0,
    required this.w1,
    required this.epoches,
    required this.learningRate,
    required this.input1,
    required this.input2,
    this.output,
  });

  final int id;

  final double w0;
  final double w1;

  final int input1;
  final int input2;

  final int epoches;

  @JsonKey(name: 'learning_rate')
  final double learningRate;

  final int? output;

  factory PerceptronModel.fromJson(Map<String, dynamic> json) =>
      _$PerceptronModelFromJson(json);

  Map<String, dynamic> toJson() => _$PerceptronModelToJson(this);

  @override
  String toString() => toJson().toString();
}
