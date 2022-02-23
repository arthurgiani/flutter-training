import 'dart:math';

import 'package:tests_example/repositories/number_repository.dart';

class DependentMethods {
  final NumbersRepository numbersRepository;

  DependentMethods(this.numbersRepository);

  double powerNumberByTwo() {
    final randomNumber = numbersRepository.getRandomDouble();
    if (randomNumber == double.infinity) {
      throw Exception();
    }
    final result = pow(randomNumber, 2).toDouble();
    return result;
  }
}
