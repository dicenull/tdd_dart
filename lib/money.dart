import 'package:tdd_dart/bank.dart';
import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/sum.dart';

class Money implements Expression {
  final int amount;
  final String currencyName;

  Money(this.amount, this.currencyName);

  @override
  Expression times(int multiplier) {
    return Money(amount * multiplier, currencyName);
  }

  String get currency => currencyName;

  equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && currency == money.currency;
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

  @override
  Expression plus(Expression addend) {
    return Sum(this, addend);
  }

  @override
  Money reduce(Bank bank, String to) {
    final rate = bank.rate(currency, to);
    return Money(amount ~/ rate, to);
  }
}
