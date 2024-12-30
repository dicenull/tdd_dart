import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/sum.dart';

class Money implements Expression {
  final int amount;
  final String currencyName;

  Money(this.amount, this.currencyName);

  Money times(int multiplier) {
    return Money(amount * multiplier, currencyName);
  }

  String currency() {
    return currencyName;
  }

  equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && currency() == money.currency();
  }

  @override
  bool operator ==(Object other) => equals(other);

  @override
  String toString() {
    return '$amount $currencyName';
  }

  static Money dollar(int amount) {
    return Money(amount, 'USD');
  }

  static Money franc(int amount) {
    return Money(amount, 'CHF');
  }

  Expression plus(Money addend) {
    return Sum(this, addend);
  }
}
