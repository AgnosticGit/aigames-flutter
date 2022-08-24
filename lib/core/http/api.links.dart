class ApiLinks {
  const ApiLinks._();

  static const url = 'http://127.0.0.1:8000/';

  static const perceptron = '${url}perceptron/';
  static const tryPerceptron = '${url}perceptron/try';
  static const trainPerceptron = '${url}perceptron/train';
  static const resetPerceptron = '${url}perceptron/reset';
  static const initGradientDescent2d = '${url}gradient_descent_2d/';
  static const gradientDescent2dMathExpression =
      '${url}gradient_descent_2d/math_expression';
}
