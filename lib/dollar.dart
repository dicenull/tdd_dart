import 'package:tdd_dart/money.dart';

class Dollar extends Money {
  Dollar(int amount, String name) : super(amount, name);

  @override
  Money times(int multiplier) {
    return Money.dollar(amount * multiplier);
  }
}
