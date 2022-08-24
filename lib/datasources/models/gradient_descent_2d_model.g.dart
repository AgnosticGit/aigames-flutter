// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_descent_2d_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GradientDescent2dModelCWProxy {
  GradientDescent2dModel delta(double? delta);

  GradientDescent2dModel initialPointX(double? initialPointX);

  GradientDescent2dModel mathExpression(String? mathExpression);

  GradientDescent2dModel points(Map<String, dynamic>? points);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GradientDescent2dModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GradientDescent2dModel(...).copyWith(id: 12, name: "My name")
  /// ````
  GradientDescent2dModel call({
    double? delta,
    double? initialPointX,
    String? mathExpression,
    Map<String, dynamic>? points,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGradientDescent2dModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGradientDescent2dModel.copyWith.fieldName(...)`
class _$GradientDescent2dModelCWProxyImpl
    implements _$GradientDescent2dModelCWProxy {
  final GradientDescent2dModel _value;

  const _$GradientDescent2dModelCWProxyImpl(this._value);

  @override
  GradientDescent2dModel delta(double? delta) => this(delta: delta);

  @override
  GradientDescent2dModel initialPointX(double? initialPointX) =>
      this(initialPointX: initialPointX);

  @override
  GradientDescent2dModel mathExpression(String? mathExpression) =>
      this(mathExpression: mathExpression);

  @override
  GradientDescent2dModel points(Map<String, dynamic>? points) =>
      this(points: points);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GradientDescent2dModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GradientDescent2dModel(...).copyWith(id: 12, name: "My name")
  /// ````
  GradientDescent2dModel call({
    Object? delta = const $CopyWithPlaceholder(),
    Object? initialPointX = const $CopyWithPlaceholder(),
    Object? mathExpression = const $CopyWithPlaceholder(),
    Object? points = const $CopyWithPlaceholder(),
  }) {
    return GradientDescent2dModel(
      delta: delta == const $CopyWithPlaceholder()
          ? _value.delta
          // ignore: cast_nullable_to_non_nullable
          : delta as double?,
      initialPointX: initialPointX == const $CopyWithPlaceholder()
          ? _value.initialPointX
          // ignore: cast_nullable_to_non_nullable
          : initialPointX as double?,
      mathExpression: mathExpression == const $CopyWithPlaceholder()
          ? _value.mathExpression
          // ignore: cast_nullable_to_non_nullable
          : mathExpression as String?,
      points: points == const $CopyWithPlaceholder()
          ? _value.points
          // ignore: cast_nullable_to_non_nullable
          : points as Map<String, dynamic>?,
    );
  }
}

extension $GradientDescent2dModelCopyWith on GradientDescent2dModel {
  /// Returns a callable class that can be used as follows: `instanceOfGradientDescent2dModel.copyWith(...)` or like so:`instanceOfGradientDescent2dModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GradientDescent2dModelCWProxy get copyWith =>
      _$GradientDescent2dModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradientDescent2dModel _$GradientDescent2dModelFromJson(
        Map<String, dynamic> json) =>
    GradientDescent2dModel(
      initialPointX: (json['initial_point_x'] as num?)?.toDouble(),
      delta: (json['delta'] as num?)?.toDouble(),
      mathExpression: json['math_expression'] as String?,
      points: json['points'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GradientDescent2dModelToJson(
        GradientDescent2dModel instance) =>
    <String, dynamic>{
      'initial_point_x': instance.initialPointX,
      'points': instance.points,
      'math_expression': instance.mathExpression,
      'delta': instance.delta,
    };
