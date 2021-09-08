enum Operation { NONE, ADD, SUBTRACT, MULTIPLY, DIVIDE, REMOVE, EQUAL, CLEAR }

extension OperationManager on Operation {
  BigInt perform(BigInt acc, BigInt arg) {
    switch (this) {
      case Operation.NONE:
        return arg;
      case Operation.ADD:
        return acc + arg;
      case Operation.SUBTRACT:
        return acc - arg;
      case Operation.MULTIPLY:
        return acc * arg;
      case Operation.DIVIDE:
        return acc ~/ arg;
      default:
        return acc;
    }
  }
}
