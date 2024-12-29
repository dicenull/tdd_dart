import 'package:tdd_dart/money.dart';
import 'package:test/test.dart';

void main() {
  test('掛け算', () async {
    final five = Dollar(5);
    var product = five.times(2);

    expect(10, equals(product.amount));

    product = five.times(3);
    expect(15, equals(product.amount));
  });
}
