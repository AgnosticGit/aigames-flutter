import 'package:aigames_flutter/core/http/failures.dart';
import 'package:aigames_flutter/core/style/texts.dart';
import 'package:aigames_flutter/datasources/interfaces/gradient_descent_2d_datasource.dart';
import 'package:aigames_flutter/datasources/models/gradient_descent_2d_model.dart';
import 'package:aigames_flutter/entities/entity.dart';

class GradientDescent2dEntity extends Entity {
  GradientDescent2dEntity({
    this.datasource,
  });

  GradientDescent2dDatasource? datasource;

  GradientDescent2dModel model = GradientDescent2dModel();

  void onEnterMathExpression(String expression) {
    model = model.copyWith(mathExpression: expression);
    update();
  }

  void onEnterPointX(String x) {
    model = model.copyWith(pointX: double.tryParse(x));
    update();
  }

  Future<void> initGradientDescent() async {
    if (datasource != null) {
      final leftOrRight = await datasource!.initGradientDescent();

      if (leftOrRight.isRight()) {
        model = leftOrRight.getRight().toNullable()!;
        setFailure(null);
      } else {
        final failure = leftOrRight.getLeft().toNullable();
        setFailure(failure);
      }
    }
  }

  Future<void> setMathExpression() async {
    if (datasource != null) {
      if (model.mathExpression != null && model.mathExpression!.isNotEmpty) {
        final leftOrRight =
            await datasource!.setMathExpression(model.mathExpression!);

        if (leftOrRight.isRight()) {
          model = leftOrRight.getRight().toNullable()!;
          setFailure(null);
        } else {
          final failure = leftOrRight.getLeft().toNullable();
          setFailure(failure);
        }
      } else {
        setFailure(
          LocalFailure(message: Texts.incorrectMathExpressionWithExample),
        );
      }
    }
  }

  Future<void> setPointX() async {
    if (datasource != null) {
      if (model.pointX != null && model.pointX! >= -10 && model.pointX! <= 10) {
        final leftOrRight = await datasource!.setX(model.pointX!);

        if (leftOrRight.isRight()) {
          model = leftOrRight.getRight().toNullable()!;
          setFailure(null);
        } else {
          final failure = leftOrRight.getLeft().toNullable();
          setFailure(failure);
        }
      } else {
        setFailure(LocalFailure(message: Texts.incorrectPointX));
      }
    }
  }

  Future<void> descent() async {
    if (datasource != null) {
      final leftOrRight = await datasource!.descent();

      if (leftOrRight.isRight()) {
        model = leftOrRight.getRight().toNullable()!;
        print(model);
        setFailure(null);
      } else {
        final failure = leftOrRight.getLeft().toNullable();
        setFailure(failure);
      }
    }
  }
}
