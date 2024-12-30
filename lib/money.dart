import 'package:tdd_dart/dollar.dart';
import 'package:tdd_dart/franc.dart';

abstract class Money {
  final int amount;
  final String currencyName;

  Money(this.amount, this.currencyName);

  Money times(int multiplier);

  String currency() {
    return currencyName;
  }

  equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && runtimeType == money.runtimeType;
  }

  @override
  bool operator ==(Object other) => equals(other);

  static Money dollar(int amount) {
    return Dollar(amount, 'USD');
  }

  static Money franc(int amount) {
    return Franc(amount, 'CHF');
  }
}
