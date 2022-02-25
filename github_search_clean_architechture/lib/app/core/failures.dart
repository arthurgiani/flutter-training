import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class Failure {
  final String message;
  final StackTrace? stackTrace;
  final String? label;

  Failure({
    required this.message,
    required this.stackTrace,
    required this.label,
  }) {
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace, label: label);
    }
  }
}
