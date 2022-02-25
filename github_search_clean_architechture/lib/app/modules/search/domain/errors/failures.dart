import 'package:github_search_clean_architechture/app/core/failures.dart';

abstract class ProfileFailure extends Failure {
  ProfileFailure({
    required String message,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}

class ProfileDatasourceFailure extends ProfileFailure {
  ProfileDatasourceFailure({
    required String message,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}

class ProfileParseFailure extends ProfileFailure {
  ProfileParseFailure({
    required String message,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}

// FormatExpception - int -> double (2.1)
// TypeError - String -> null

class ProfileNoInternetFailure extends ProfileFailure {
  ProfileNoInternetFailure({
    required String message,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}

class ProfileUnknownFailure extends ProfileFailure {
  ProfileUnknownFailure({
    required String message,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}

class ShortProfileNameFailure extends ProfileFailure {
  ShortProfileNameFailure({
    required String message,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}
