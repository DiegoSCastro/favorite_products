import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RatingModel', () {
    test('fromJson should return a valid RatingModel instance', () {
      final json = {
        'rate': 4.5,
        'count': 100,
      };

      final ratingModel = RatingModel.fromJson(json);

      expect(ratingModel.rate, equals(4.5));
      expect(ratingModel.count, equals(100));
    });

    test('toJson should return a valid JSON map', () {
      const ratingModel = RatingModel(rate: 4.5, count: 100);

      final json = ratingModel.toJson();

      expect(json, equals({
        'rate': 4.5,
        'count': 100,
      }));
    });

    test('toEntity should return a valid Rating instance', () {
      const ratingModel = RatingModel(rate: 4.5, count: 100);

      final rating = ratingModel.toEntity();

      expect(rating.rate, equals(4.5));
      expect(rating.count, equals(100));
    });
  });
}
