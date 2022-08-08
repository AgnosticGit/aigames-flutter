import 'package:aigames_flutter/datasources/implementations/api_perceptron_impl.dart';
import 'package:aigames_flutter/entities/perceptron_entity.dart';

class Di {
  Di._();

  static final perceptron = PerceptronEntity(datasource: ApiPerceptronImpl());
}
