class IndependentMethods {
  double sumOfTwoNumbers({
    required double number1,
    required double number2,
  }) {
    final number = number1 + number2;
    return number;
  }

  double divideTwoNumber2({
    required double numerator,
    required double denominator,
  }) {
    if (denominator == 0) {
      throw Exception();
    }
    final number = numerator / denominator;
    return number;
  }
}
