class Dollar {
  final int _amount;

  Dollar(this._amount);

  Dollar times(int multiplier) {
    return Dollar(_amount * multiplier);
  }

  equals(Object object) {
    Dollar dollar = object as Dollar;
    return _amount == dollar._amount;
  }

  @override
  bool operator ==(Object other) => equals(other);
}
