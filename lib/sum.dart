import 'package:tdd_dart/bank.dart';
import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/money.dart';

class Sum implements Expression {
  Expression augend;
  Expression addend;

  Sum(this.augend, this.addend);

  @override
  Money reduce(Bank bank, String to) {
    final amount =
        augend.reduce(bank, to).amount + addend.reduce(bank, to).amount;
    return Money(amount, to);
  }

  @override
  Expression plus(Expression addend) {
    return Sum(this, addend);
  }
}
