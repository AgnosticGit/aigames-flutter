import 'package:aigames_flutter/core/http/failure.dart';
import 'package:aigames_flutter/datasources/models/gradient_descent_2d_model.dart';
import 'package:aigames_flutter/datasources/models/perceptron_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class GradientDescent2dDatasource {
  Future<Either<Failure, GradientDescent2dModel>> initGradientDescent();

  Future<Either<Failure, GradientDescent2dModel>> setMathExpression(
    String expression,
  );
}
