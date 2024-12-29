class Franc {
  final int _amount;

  Franc(this._amount);

  Franc times(int multiplier) {
    return Franc(_amount * multiplier);
  }

  equals(Object object) {
    Franc franc = object as Franc;
    return _amount == franc._amount;
  }

  @override
  bool operator ==(Object other) => equals(other);
}
