import 'package:tdd_dart/money.dart';

class Franc extends Money {
  Franc(int amount) : super(amount);

  Franc times(int multiplier) {
    return Franc(amount * multiplier);
  }
}
