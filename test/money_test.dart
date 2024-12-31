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
    expect('USD', equals(Money.dollar(1).currency));
    expect('CHF', equals(Money.franc(1).currency));
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

  test('$Sumを$Bankで換金できる', () {
    Expression sum = Sum(Money.dollar(3), Money.dollar(4));
    final bank = Bank();

    // 仮実装が10ドルなので、失敗するような値を選ぶ
    final result = bank.reduce(sum, 'USD');
    expect(Money.dollar(7), equals(result));
  });

  test('$Moneyを換金できる', () {
    final bank = Bank();
    final result = bank.reduce(Money.dollar(1), 'USD');
    expect(Money.dollar(1), equals(result));
  });

  test('1USD:1USD', () {
    final bank = Bank();
    expect(1, equals(bank.rate('USD', 'USD')));
  });

  test('異なる通貨を換金できる', () {
    final bank = Bank();
    bank.addRate('CHF', 'USD', 2);
    final result = bank.reduce(Money.franc(2), 'USD');
    expect(Money.dollar(1), equals(result));
  });

  test('5USD+10CHFは10USD(レートが2:1)', () {
    Expression fiveBucks = Money.dollar(5);
    Expression tenFrancs = Money.franc(10);
    final bank = Bank();
    bank.addRate('CHF', 'USD', 2);
    Money result = bank.reduce(fiveBucks.plus(tenFrancs), 'USD');
    expect(Money.dollar(10), equals(result));
  });

  test('$Sumに$Moneyを足し算できる', () {
    final fiveBucks = Money.dollar(5);
    final tenFrancs = Money.franc(10);
    final bank = Bank();
    bank.addRate('CHF', 'USD', 2);

    // Sumのplusをテストしたい
    Expression sum = Sum(fiveBucks, tenFrancs).plus(fiveBucks);

    final result = bank.reduce(sum, 'USD');
    expect(Money.dollar(15), equals(result));
  });

  test('$Sumに掛け算できる', () {
    final fiveBucks = Money.dollar(5);
    final tenFrancs = Money.franc(10);
    final bank = Bank();
    bank.addRate('CHF', 'USD', 2);

    Expression sum = Sum(fiveBucks, tenFrancs).times(2);

    final result = bank.reduce(sum, 'USD');
    expect(Money.dollar(20), equals(result));
  });
}
