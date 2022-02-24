import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:tests_example/repositories/number_repository.dart';

class EitherDependentMethods {
  final NumbersRepository numbersRepository;

  EitherDependentMethods(this.numbersRepository);

  Either<Exception, double> powerNumberByTwo() {
    final randomNumber = numbersRepository.getRandomDouble();
    if (randomNumber == double.infinity) {
      return Left(Exception());
    }
    final result = pow(randomNumber, 2).toDouble();
    return Right(result);
  }
}
