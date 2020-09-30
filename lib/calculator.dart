import 'package:calculator_flutter/operation_manager.dart';

class Calculator {

  Operation operation = Operation.NONE;
  BigInt accumulator = BigInt.zero;

  BigInt evaluate(BigInt value) {
    return accumulator = operation.perform(accumulator, value);
  }

  void setOperation(Operation operation) {
    this.operation = operation;
  }

  void clear() {
    operation = Operation.NONE;
    accumulator = BigInt.zero;
  }
}