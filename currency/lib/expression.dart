import 'package:tdd_dart/bank.dart';
import 'package:tdd_dart/money.dart';

abstract interface class Expression {
  Money reduce(Bank bank, String to);

  Expression plus(Expression addend);

  Expression times(int multiplier);
}
