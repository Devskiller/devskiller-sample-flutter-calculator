class Display {
  BigInt _value = BigInt.zero;
  bool completed = false;

  void insertDigit(int digit) {
    if (completed) {
      this._value = BigInt.zero;
      completed = false;
    }
    this._value = _value * BigInt.from(10) + BigInt.from(digit);
  }

  void removeDigit() {
    _value = _value ~/ BigInt.from(10);
  }

  void clear() {
    _value = BigInt.zero;
  }

  BigInt getValue() {
    return _value;
  }

  void setValue(BigInt value) {
    this._value = value;
    completed = true;
  }

  String getLine() {
    return _value.toString();
  }
}
