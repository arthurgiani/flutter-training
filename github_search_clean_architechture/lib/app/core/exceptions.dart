abstract class CustomException {
  final String message;
  final StackTrace? stackTrace;

  CustomException({required this.message, required this.stackTrace});
}

class DatasourceExpcetion extends CustomException {
  DatasourceExpcetion({
    required String message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class NoInternetExpcetion extends CustomException {
  NoInternetExpcetion({
    required String message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
