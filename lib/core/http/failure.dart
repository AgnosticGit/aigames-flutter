import 'dart:developer';

/// Base class for all types of failures
abstract class Failure {
  Failure({required this.message, this.code}) {
    log(toString());
  }

  final String message;
  final int? code;

  @override
  String toString() {
    final obj = {'message': message};

    if (code != null) {
      obj['code'] = code.toString();
    }

    return obj.toString();
  }
}
