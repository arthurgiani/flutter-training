/// Set of simple math operations.
class Calculator {
  /// Value of [firstNumber] to be used on this.
  final double firstNumber;

  /// Value of [secondNumber] to be used on this.
  final double secondNumber;

  /// This constructor accepts both parameters as [double].
  ///
  /// ```dart
  /// final calculator = Calculator(10,20);
  /// ```
  Calculator(this.firstNumber, this.secondNumber);

  /// Returns sum of [firstNumber] with [secondNumber].
  /// ```dart
  /// final result = sum(3,4) // 7
  /// ```
  double sum() {
    return firstNumber + secondNumber;
  }

  /// Returns a division of [firstNumber] by [secondNumber].
  ///
  /// [firstNumber] is the numerator and [secondNumber] is the denominator.
  /// ```dart
  /// final result = divide(10,5) // 2
  /// ```
  /// If [secondNumber] is zero, an [Exception] will be thrown because division by zero is not allowed.
  /// ```dart
  /// final exception = divide(10,0) // Throws an Expcetion
  /// ```
  double divide() {
    if (secondNumber == 0) {
      throw Exception("Can't divide number by zero");
    }
    return firstNumber / secondNumber;
  }

  /// Returns [firstNumber] times [secondNumber].
  /// ```dart
  /// final result = multiply(10,5) // 50
  /// ```
  double multiply() {
    return firstNumber * secondNumber;
  }

  /// Returns [firstNumber] subtracted by [secondNumber].
  /// ```dart
  /// final result = subtract(10,8) // 2
  /// ```
  double subtract() {
    return firstNumber - secondNumber;
  }
}
