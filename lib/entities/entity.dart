import '../core/http/failure.dart';
import '../core/state_manager/observer.dart';

abstract class Entity extends Observer {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Failure? _failure;
  Failure? get failure => _failure;

  void setIsLoading(bool newIsLoading) {
    _isLoading = newIsLoading;
    update();
  }

  void setFailure(Failure? newFailure) {
    _failure = newFailure;
    update();
  }
}
