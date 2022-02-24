import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tests_example/methods/either_dependent_methods.dart';
import 'package:tests_example/repositories/number_repository.dart';

class NumbersRepositoryMock extends Mock implements NumbersRepository {}

void main() {
  late NumbersRepository numbersRepository;
  late EitherDependentMethods eitherDependentMethods;

  setUp(() {
    numbersRepository = NumbersRepositoryMock();
    eitherDependentMethods = EitherDependentMethods(numbersRepository);
  });

  group('powerNumberByTwo', () {
    test(
      'should return number from repository by the power of 2 when number != double.infinity',
      () {
        //Arrange
        when(() => numbersRepository.getRandomDouble()).thenReturn(10);

        //Act
        final result = eitherDependentMethods.powerNumberByTwo();

        //Assert
        expect(result.fold((left) => left, (right) => right), 100);
      },
    );

    test(
      'should return Exception when number from repository == double.infinity',
      () {
        //Arrange
        when(() => numbersRepository.getRandomDouble())
            .thenReturn(double.infinity);

        //Act
        final result = eitherDependentMethods.powerNumberByTwo();

        //Assert
        expect(result.fold((left) => left, (right) => right), isA<Exception>());
      },
    );
  });
}
