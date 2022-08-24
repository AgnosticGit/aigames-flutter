import 'dart:developer';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gradient_descent_2d_model.g.dart';

@JsonSerializable()
@CopyWith()
class GradientDescent2dModel {
  GradientDescent2dModel({
    this.pointX,
    this.pointY,
    this.delta,
    this.mathExpression,
    this.points,
  });

  @JsonKey(name: 'point_x')
  final double? pointX;

  @JsonKey(name: 'point_y')
  final double? pointY;

  final Map<String, dynamic>? points;

  @JsonKey(name: 'math_expression')
  final String? mathExpression;

  final double? delta;

  factory GradientDescent2dModel.fromJson(Map<String, dynamic> json) =>
      _$GradientDescent2dModelFromJson(json);

  Map<String, dynamic> toJson() => _$GradientDescent2dModelToJson(this);

  List<double>? getPointsX() {
    if (points != null) {
      return points!['points_x']
          .map((e) => e.toDouble())
          .toList()
          .cast<double>();
    }
    return null;
  }

  List<double>? getPointsY() {
    if (points != null) {
      return points!['points_y']
          .toList()
          .map((e) => e.toDouble())
          .toList()
          .cast<double>();
    }
    return null;
  }

  List<FlSpot> pointsToFlSpot() {
    List<FlSpot> spots = [];

    if (points != null) {
      final x = getPointsX() ?? [];
      final y = getPointsY() ?? [];

      if (x.length == y.length) {
        for (int i = 0; i < x.length; i++) {
          spots.add(FlSpot(x[i], y[i]));
        }
      }
    }

    return spots;
  }

  @override
  String toString() => toJson().toString();
}
