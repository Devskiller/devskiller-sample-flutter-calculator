import 'package:calculator_flutter/calculator.dart';
import 'package:calculator_flutter/operation_manager.dart';
import 'package:test/test.dart';

void main() {
  late Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });

  test('shouldSetValueOnEmptyCalculator', () {
    final BigInt result = calculator.evaluate(BigInt.from(4));

    expect(result, BigInt.from(4));
  });

  test('shouldEvaluateAdding', () {
    calculator.evaluate(BigInt.from(2));
    calculator.setOperation(Operation.ADD);

    final BigInt result = calculator.evaluate(BigInt.from(2));

    expect(result, BigInt.from(4));
  });

  test('shouldEvaluateSubtraction', () {
    calculator.evaluate(BigInt.from(4));
    calculator.setOperation(Operation.SUBTRACT);

    final BigInt result = calculator.evaluate(BigInt.from(2));

    expect(result, BigInt.from(2));
  });

  test('shouldEvaluateMultiplication', () {
    calculator.evaluate(BigInt.from(4));
    calculator.setOperation(Operation.MULTIPLY);

    final BigInt result = calculator.evaluate(BigInt.from(4));

    expect(result, BigInt.from(16));
  });

  test('shouldEvaluateDivision', () {
    calculator.evaluate(BigInt.from(16));
    calculator.setOperation(Operation.DIVIDE);

    final BigInt result = calculator.evaluate(BigInt.from(4));

    expect(result, BigInt.from(4));
  });

  test(
    'shouldThrowWhenDividedByZero',
    () {
      calculator.evaluate(BigInt.from(10));
      calculator.setOperation(Operation.DIVIDE);

      expect(() => calculator.evaluate(BigInt.zero),
          throwsA(isA<IntegerDivisionByZeroException>()));
    },
  );
}
