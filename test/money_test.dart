import 'package:tdd_dart/bank.dart';
import 'package:tdd_dart/expression.dart';
import 'package:tdd_dart/money.dart';
import 'package:tdd_dart/sum.dart';
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

    expect(Money.franc(5).equals(Money.dollar(5)), isFalse);
  });

  test('通貨', () async {
    expect('USD', equals(Money.dollar(1).currency()));
    expect('CHF', equals(Money.franc(1).currency()));
  });

  test('5ドル+5ドルは10ドル', () {
    final five = Money.dollar(5);
    Expression sum = five.plus(five);
    final bank = Bank();
    final reduced = bank.reduce(sum, 'USD');

    expect(Money.dollar(10), equals(reduced));
  });

  test('$Moneyの合計は$Sumである', () {
    final five = Money.dollar(5);
    Expression result = five.plus(five);
    final sum = result as Sum;

    expect(five, equals(sum.augend));
    expect(five, equals(sum.addend));
  });
}
