import 'package:tdd_dart/money.dart';
import 'package:test/test.dart';

void main() {
  test('掛け算', () async {
    final five = Dollar(5);

    five.times(2);

    expect(10, equals(five.amount));
  });
}
