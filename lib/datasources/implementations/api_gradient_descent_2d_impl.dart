import 'package:aigames_flutter/core/http/failure.dart';
import 'package:aigames_flutter/datasources/interfaces/gradient_descent_2d_datasource.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:aigames_flutter/datasources/models/gradient_descent_2d_model.dart';

import '../../core/http/api.links.dart';
import '../../core/http/failures.dart';

class ApiGradientDescent2dImpl implements GradientDescent2dDatasource {
  @override
  Future<Either<Failure, GradientDescent2dModel>> setMathExpression(
    String expression,
  ) async {
    try {
      final response = await Dio().post(
        ApiLinks.gradientDescent2dMathExpression,
        data: {'math_expression': expression},
      );

      final Map<String, dynamic> json = response.data['data'];

      return Right(GradientDescent2dModel.fromJson(json));
    } on DioError catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, GradientDescent2dModel>> initGradientDescent() async {
    try {
      final response = await Dio().get(ApiLinks.initGradientDescent2d);

      final Map<String, dynamic> json = response.data['data'];

      return Right(GradientDescent2dModel.fromJson(json));
    } on DioError catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
