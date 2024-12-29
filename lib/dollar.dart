import 'package:tdd_dart/money.dart';

class Dollar extends Money {
  Dollar(int amount) : super(amount);

  Money times(int multiplier) {
    return Dollar(amount * multiplier);
  }
}
