import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Rating', () {
    test('Should create a Rating object', () {
      const rating = Rating(rate: 4.5, count: 100);

      expect(rating.rate, equals(4.5));
      expect(rating.count, equals(100));
    });

    test('Should create a Rating object from JSON', () {
      final json = {'rate': 3.8, 'count': 50};
      final rating = Rating.fromJson(json);

      expect(rating.rate, equals(3.8));
      expect(rating.count, equals(50));
    });

    test('Should return JSON from Rating object', () {
      const rating = Rating(rate: 4.2, count: 75);
      final json = rating.toJson();

      expect(json, equals({'rate': 4.2, 'count': 75}));
    });

    test('Should create a Rating object with default values', () {
      const rating = Rating(rate: 0.0, count: 0);

      expect(rating.rate, equals(0.0));
      expect(rating.count, equals(0));
    });
  });
}
