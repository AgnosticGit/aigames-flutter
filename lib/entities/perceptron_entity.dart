import 'package:aigames_flutter/core/http/failure.dart';
import 'package:aigames_flutter/core/state_manager/observer.dart';
import 'package:aigames_flutter/datasources/interfaces/perceptron_datasource.dart';
import 'package:aigames_flutter/datasources/models/perceptron_model.dart';
import 'package:aigames_flutter/entities/entity.dart';

class PerceptronEntity extends Entity {
  PerceptronEntity({this.datasource});

  PerceptronDatasource? datasource;

  PerceptronModel perceptron =
      PerceptronModel(id: 0, w0: 0.0, w1: 0.0, epoches: 1, learningRate: 0.1);

  Future<void> getPerceptron() async {
    if (datasource != null) {
      final leftOrRight = await datasource!.getPerceptron();

      if (leftOrRight.isRight()) {
        perceptron = leftOrRight.getRight().toNullable()!;
        update();
      } else {
        final failure = leftOrRight.getLeft().toNullable();
        setFailure(failure);
      }
    }
  }

  void setLearningRate(double newRate) {
    perceptron = perceptron.copyWith(learningRate: newRate);
    update();
  }

  void setEpoches(int newEpoches) {
    perceptron = perceptron.copyWith(epoches: newEpoches);
    update();
  }

  void setInput1(int newInput1) {
    perceptron = perceptron.copyWith(input1: newInput1);
    update();
  }

  void setInput2(int newInput2) {
    perceptron = perceptron.copyWith(input2: newInput2);
    update();
  }
}
