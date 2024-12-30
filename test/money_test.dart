import 'package:tdd_dart/money.dart';
import 'package:test/test.dart';

void main() {
  test('掛け算', () async {
    Money five = Money.dollar(5);
    expect(Money.dollar(10), equals(five.times(2)));
    expect(Money.dollar(15), equals(five.times(3)));
  });

  test('等価性', () async {
    expect(Money.dollar(5).equals(Money.dollar(5)), isTrue);
    expect(Money.dollar(5).equals(Money.dollar(6)), isFalse);

    expect(Money.franc(5).equals(Money.franc(5)), isTrue);
    expect(Money.franc(5).equals(Money.franc(6)), isFalse);

    expect(Money.franc(5).equals(Money.dollar(5)), isFalse);
  });

  test('フランの掛け算', () async {
    final five = Money.franc(5);
    expect(Money.franc(10), equals(five.times(2)));
    expect(Money.franc(15), equals(five.times(3)));
  });

  test('通貨', () async {
    expect('USD', equals(Money.dollar(1).currency()));
    expect('CHF', equals(Money.franc(1).currency()));
  });
}
