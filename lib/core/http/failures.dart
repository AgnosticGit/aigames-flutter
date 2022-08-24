import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure({
    required super.message,
    super.code,
  });
}

class LocalFailure extends Failure {
  LocalFailure({
    required super.message,
    super.code,
  });
}
