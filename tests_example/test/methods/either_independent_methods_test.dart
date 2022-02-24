import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/methods/either_independent_methods.dart';

void main() {
  late EitherIndependentMethods eitherIndependentMethods;

  setUp(() {
    eitherIndependentMethods = EitherIndependentMethods();
  });

  group('divideTwoNumbers', () {
    test('should return numerator/denominator when denominator != 0', () {
      //Arrange
      const double numerator = 10;
      const double denominator = 5;

      //Act
      final result = eitherIndependentMethods.divideTwoNumbers(
        numerator: numerator,
        denominator: denominator,
      );

      //Assert
      expect(result.fold((left) => left, (right) => right), 2);
    });

    test('should return Exception when denominator == 0', () {
      //Arrange
      const double numerator = 10;
      const double denominator = 0;

      //Act
      final result = eitherIndependentMethods.divideTwoNumbers(
        numerator: numerator,
        denominator: denominator,
      );

      //Assert
      expect(result.fold((left) => left, (right) => right), isA<Exception>());
    });
  });
}
