class Money {
  final int amount;

  Money(this.amount);

  equals(Object object) {
    Money money = object as Money;
    return amount == money.amount;
  }

  @override
  bool operator ==(Object other) => equals(other);
}
