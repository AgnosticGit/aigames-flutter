import 'dart:developer';

/// Base class for all types of failures
abstract class Failure {
  Failure({required this.message, this.code}) {
    log(toString());
  }

  final String message;
  final int? code;
}
