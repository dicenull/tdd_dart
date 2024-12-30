import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/money.dart';
import 'package:tdd_dart/sum.dart';

class Bank {
  Money reduce(Expression source, String to) {
    final sum = source as Sum;
    return sum.reduce(to);
  }
}
