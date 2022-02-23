import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/methods/independent_methods.dart';

void main() {
  //declaração de variáveis
  late IndependentMethods independentMethods;

  setUp(() {
    //roda antes de cada teste
    independentMethods = IndependentMethods();
  });

  setUpAll(() {
    //inicializaçao antes de todos os testes
  });

  tearDown(() {
    //roda depois de cada teste
  });

  tearDownAll(() {
    //rodar depois de todos os testes
  });

  group('sumOfTwoNumbers', () {
    test('should return sum of two number', () {
      //Arrange
      const double number1 = 10;
      const double number2 = 20;

      //Act
      final number = independentMethods.sumOfTwoNumbers(
        number1: number1,
        number2: number2,
      );

      //Assert
      expect(number, 30);
    });
  });

  group('divideTwoNumbers', () {
    test('should return numerator/denominator when denominator != 0', () {
      //Arrange
      const double numerator = 10;
      const double denominator = 2;

      //Act
      final number = independentMethods.divideTwoNumber2(
        numerator: numerator,
        denominator: denominator,
      );

      //Assert
      expect(number, 5);
    });

    test('should throw Exception when denominator = 0', () {
      //Arrange
      const double numerator = 10;
      const double denominator = 0;

      //Act
      //final number = independentMethods.divideTwoNumber(
      //  numerator: numerator,
      //  denominator: denominator,
      //);

      //Assert
      expect(
        () => independentMethods.divideTwoNumber2(
          numerator: numerator,
          denominator: denominator,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
