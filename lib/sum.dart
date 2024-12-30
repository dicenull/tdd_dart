import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/money.dart';

class Sum implements Expression {
  Money augend;
  Money addend;

  Sum(this.augend, this.addend);

  Money reduce(String to) {
    final amount = augend.amount + addend.amount;
    return Money(amount, to);
  }
}
