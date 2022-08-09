
import 'package:aigames_flutter/core/http/api.links.dart';
import 'package:aigames_flutter/core/http/failure.dart';
import 'package:aigames_flutter/core/http/server_failure.dart';
import 'package:aigames_flutter/datasources/interfaces/perceptron_datasource.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:aigames_flutter/datasources/models/perceptron_model.dart';

class ApiPerceptronImpl implements PerceptronDatasource {
  @override
  Future<Either<Failure, PerceptronModel>> getPerceptron() async {
    try {
      final response = await Dio().get(ApiLinks.perceptron);

      final Map<String, dynamic> json = response.data['data'];

      return Right(PerceptronModel.fromJson(json));
    } on DioError catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
