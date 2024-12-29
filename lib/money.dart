import 'package:tdd_dart/dollar.dart';
import 'package:tdd_dart/franc.dart';

abstract class Money {
  final int amount;

  Money(this.amount);

  Money times(int multiplier);

  equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && runtimeType == money.runtimeType;
  }

  @override
  bool operator ==(Object other) => equals(other);

  static Money dollar(int amount) {
    return Dollar(amount);
  }

  static Money franc(int amount) {
    return Franc(amount);
  }
}
