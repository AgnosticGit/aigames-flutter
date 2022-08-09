// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perceptron_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PerceptronModelCWProxy {
  PerceptronModel epoches(int epoches);

  PerceptronModel id(int id);

  PerceptronModel input1(int? input1);

  PerceptronModel input2(int? input2);

  PerceptronModel learningRate(double learningRate);

  PerceptronModel w0(double w0);

  PerceptronModel w1(double w1);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PerceptronModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PerceptronModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PerceptronModel call({
    int? epoches,
    int? id,
    int? input1,
    int? input2,
    double? learningRate,
    double? w0,
    double? w1,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPerceptronModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPerceptronModel.copyWith.fieldName(...)`
class _$PerceptronModelCWProxyImpl implements _$PerceptronModelCWProxy {
  final PerceptronModel _value;

  const _$PerceptronModelCWProxyImpl(this._value);

  @override
  PerceptronModel epoches(int epoches) => this(epoches: epoches);

  @override
  PerceptronModel id(int id) => this(id: id);

  @override
  PerceptronModel input1(int? input1) => this(input1: input1);

  @override
  PerceptronModel input2(int? input2) => this(input2: input2);

  @override
  PerceptronModel learningRate(double learningRate) =>
      this(learningRate: learningRate);

  @override
  PerceptronModel w0(double w0) => this(w0: w0);

  @override
  PerceptronModel w1(double w1) => this(w1: w1);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PerceptronModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PerceptronModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PerceptronModel call({
    Object? epoches = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? input1 = const $CopyWithPlaceholder(),
    Object? input2 = const $CopyWithPlaceholder(),
    Object? learningRate = const $CopyWithPlaceholder(),
    Object? w0 = const $CopyWithPlaceholder(),
    Object? w1 = const $CopyWithPlaceholder(),
  }) {
    return PerceptronModel(
      epoches: epoches == const $CopyWithPlaceholder() || epoches == null
          ? _value.epoches
          // ignore: cast_nullable_to_non_nullable
          : epoches as int,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      input1: input1 == const $CopyWithPlaceholder()
          ? _value.input1
          // ignore: cast_nullable_to_non_nullable
          : input1 as int?,
      input2: input2 == const $CopyWithPlaceholder()
          ? _value.input2
          // ignore: cast_nullable_to_non_nullable
          : input2 as int?,
      learningRate:
          learningRate == const $CopyWithPlaceholder() || learningRate == null
              ? _value.learningRate
              // ignore: cast_nullable_to_non_nullable
              : learningRate as double,
      w0: w0 == const $CopyWithPlaceholder() || w0 == null
          ? _value.w0
          // ignore: cast_nullable_to_non_nullable
          : w0 as double,
      w1: w1 == const $CopyWithPlaceholder() || w1 == null
          ? _value.w1
          // ignore: cast_nullable_to_non_nullable
          : w1 as double,
    );
  }
}

extension $PerceptronModelCopyWith on PerceptronModel {
  /// Returns a callable class that can be used as follows: `instanceOfPerceptronModel.copyWith(...)` or like so:`instanceOfPerceptronModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PerceptronModelCWProxy get copyWith => _$PerceptronModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerceptronModel _$PerceptronModelFromJson(Map<String, dynamic> json) =>
    PerceptronModel(
      id: json['id'] as int,
      w0: (json['w0'] as num).toDouble(),
      w1: (json['w1'] as num).toDouble(),
      epoches: json['epoches'] as int,
      learningRate: (json['learning_rate'] as num).toDouble(),
      input1: json['input1'] as int?,
      input2: json['input2'] as int?,
    );

Map<String, dynamic> _$PerceptronModelToJson(PerceptronModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'w0': instance.w0,
      'w1': instance.w1,
      'input1': instance.input1,
      'input2': instance.input2,
      'epoches': instance.epoches,
      'learning_rate': instance.learningRate,
    };
