import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/money.dart';

class Bank {
  Money reduce(Expression source, String to) {
    return source.reduce(to);
  }
}
