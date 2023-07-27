import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('String withoutDiacriticalMarks should remove diacritical marks', () {
    const originalString = 'Café à la carte';
    const expectedString = 'Cafe a la carte';

    final result = originalString.withoutDiacriticalMarks;

    expect(result, equals(expectedString));
  });

  test(
      'String withoutDiacriticalLowerCase should remove diacritical marks and convert to lower case',
      () {
    const originalString = 'Café à la carte';
    const expectedString = 'cafe a la carte';

    final result = originalString.withoutDiacriticalLowerCase;

    expect(result, equals(expectedString));
  });
}
