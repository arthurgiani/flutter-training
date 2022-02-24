import 'package:dartz/dartz.dart';

class EitherIndependentMethods {
  Either<Exception, double> divideTwoNumbers({
    required double numerator,
    required double denominator,
  }) {
    if (denominator == 0) {
      return Left(Exception());
    }
    final result = numerator / denominator;
    return Right(result);
  }
}
