import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('AppAssets should return the correct empty list placeholder path', () {
    final appAssets = AppAssets.i;
    final emptyListPlaceholderPath = appAssets.emptyListPlaceholder;
    expect(emptyListPlaceholderPath, equals('assets/svg/empty_list.svg'));
  });

  test('AppAssets should return the correct error placeholder path', () {
    final appAssets = AppAssets.i;
    final errorPlaceholderPath = appAssets.errorPlaceholder;
    expect(errorPlaceholderPath, equals('assets/svg/error.svg'));
  });
}
