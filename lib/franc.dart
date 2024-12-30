import 'package:tdd_dart/money.dart';

class Franc extends Money {
  Franc(int amount, String name) : super(amount, name);

  @override
  Money times(int multiplier) {
    return Franc(amount * multiplier, currencyName);
  }
}
