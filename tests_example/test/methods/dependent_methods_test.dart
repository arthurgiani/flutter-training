import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tests_example/methods/dependent_methods.dart';
import 'package:tests_example/repositories/number_repository.dart';

class NumberRepositoryMock extends Mock implements NumbersRepository {}

void main() {
  late NumbersRepository numbersRepository;
  late DependentMethods dependentMethods;

  setUp(() {
    numbersRepository = NumberRepositoryMock();
    dependentMethods = DependentMethods(numbersRepository);
  });

  group('powerNumberByTwo', () {
    test(
        'should return number from repository by the power of 2 when number != double.infinity',
        () {
      //Arrange
      when(() => numbersRepository.getRandomDouble()).thenReturn(20);

      //Act
      final result = dependentMethods.powerNumberByTwo();

      //Assert
      expect(result, 400);
    });

    test('should throw Exception when randomNumber = double.infinity', () {
      //Arrange
      when(() => numbersRepository.getRandomDouble())
          .thenReturn(double.infinity);

      //Act
      //final result = dependentMethods.powerNumberByTwo();

      //Assert
      expect(
          () => dependentMethods.powerNumberByTwo(), throwsA(isA<Exception>()));
    });
  });
}
