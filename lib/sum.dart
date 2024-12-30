import 'package:tdd_dart/bank.dart';
import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/money.dart';

class Sum implements Expression {
  Money augend;
  Money addend;

  Sum(this.augend, this.addend);

  @override
  Money reduce(Bank bank, String to) {
    final amount = augend.amount + addend.amount;
    return Money(amount, to);
  }
}
