class Money {
  final int amount;

  Money(this.amount);

  equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && runtimeType == money.runtimeType;
  }

  @override
  bool operator ==(Object other) => equals(other);
}
