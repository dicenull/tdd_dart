import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/money.dart';

class Bank {
  final Map<(String, String), int> _rates = {};

  Money reduce(Expression source, String to) {
    return source.reduce(this, to);
  }

  void addRate(String from, String to, int rate) {
    _rates[(from, to)] = rate;
  }

  int rate(String from, String to) {
    if (from == to) return 1;

    return _rates[(from, to)]!;
  }
}
