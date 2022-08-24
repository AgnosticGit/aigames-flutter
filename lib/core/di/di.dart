import 'package:aigames_flutter/datasources/implementations/api_gradient_descent_2d_impl.dart';
import 'package:aigames_flutter/datasources/implementations/api_perceptron_impl.dart';
import 'package:aigames_flutter/entities/gradient_descent_2d_entity.dart';
import 'package:aigames_flutter/entities/perceptron_entity.dart';

class Di {
  Di._();

  static final perceptron = PerceptronEntity(datasource: ApiPerceptronImpl());
  static final gradientDescent2d =
      GradientDescent2dEntity(datasource: ApiGradientDescent2dImpl());
}
