import 'package:aigames_flutter/core/http/failure.dart';
import 'package:aigames_flutter/datasources/models/perceptron_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class PerceptronDatasource {
  Future<Either<Failure, PerceptronModel>> getPerceptron();

  Future<Either<Failure, PerceptronModel>> tryPerceptron(
    PerceptronModel perceptronModel,
  );

  Future<Either<Failure, PerceptronModel>> trainPerceptron(
    PerceptronModel perceptronModel,
  );

  Future<Either<Failure, PerceptronModel>> resetPerceptron();
}
