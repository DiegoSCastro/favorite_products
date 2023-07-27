import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Double toCurrency should format the number as currency', () {
    const double amount = 1234.56;
    const String expectedCurrency = '\$1234.56';

    final result = amount.toCurrency();

    expect(result, equals(expectedCurrency));
  });

  test('Double toCurrency should format zero as currency', () {
    const double amount = 0.0;
    const String expectedCurrency = '\$0.00';

    final result = amount.toCurrency();

    expect(result, equals(expectedCurrency));
  });

  test('Double toCurrency should format negative number as currency', () {
    const double amount = -5678.9;
    const String expectedCurrency = '\$-5678.90';

    final result = amount.toCurrency();

    expect(result, equals(expectedCurrency));
  });
}
