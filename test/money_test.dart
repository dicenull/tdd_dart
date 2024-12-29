import 'package:tdd_dart/money.dart';
import 'package:test/test.dart';

void main() {
  test('掛け算', () async {
    final five = Dollar(5);
    expect(Dollar(10), equals(five.times(2)));
    expect(Dollar(15), equals(five.times(3)));
  });

  test('等価性', () async {
    expect(Dollar(5).equals(Dollar(5)), isTrue);
    expect(Dollar(5).equals(Dollar(6)), isFalse);
  });
}
