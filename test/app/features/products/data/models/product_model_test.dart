import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductModel', () {
    test('fromJson should return a valid ProductModel instance', () {
      final json = {
        'id': 1,
        'price': 19.99,
        'title': 'Product 1',
        'description': 'Description 1',
        'category': 'Category 1',
        'image': 'product_image1.jpg',
        'rating': {
          'rate': 4.5,
          'count': 100,
        },
      };

      final productModel = ProductModel.fromJson(json);

      expect(productModel.id, equals(1));
      expect(productModel.price, equals(19.99));
      expect(productModel.title, equals('Product 1'));
      expect(productModel.description, equals('Description 1'));
      expect(productModel.category, equals('Category 1'));
      expect(productModel.image, equals('product_image1.jpg'));
      expect(productModel.rating.rate, equals(4.5));
      expect(productModel.rating.count, equals(100));
    });

   

    test('toEntity should return a valid Product instance', () {
      const productModel = ProductModel(
        id: 1,
        price: 19.99,
        title: 'Product 1',
        description: 'Description 1',
        category: 'Category 1',
        image: 'product_image1.jpg',
        rating: RatingModel(rate: 4.5, count: 100),
      );

      final product = productModel.toEntity();

      expect(product.id, equals(1));
      expect(product.price, equals(19.99));
      expect(product.title, equals('Product 1'));
      expect(product.description, equals('Description 1'));
      expect(product.category, equals('Category 1'));
      expect(product.image, equals('product_image1.jpg'));
      expect(product.rating.rate, equals(4.5));
      expect(product.rating.count, equals(100));
    });
  });
}
