import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product', () {
    test('Should create a Product object', () {
      const rating = Rating(rate: 4.5, count: 100);
      const product = Product(
        id: 1,
        price: 19.99,
        title: 'Product 1',
        description: 'This is a product',
        category: 'Electronics',
        image: 'product_image.jpg',
        rating: rating,
      );

      expect(product.id, equals(1));
      expect(product.price, equals(19.99));
      expect(product.title, equals('Product 1'));
      expect(product.description, equals('This is a product'));
      expect(product.category, equals('Electronics'));
      expect(product.image, equals('product_image.jpg'));
      expect(product.rating, equals(rating));
    });

    test('Should create a Product object from JSON', () {
      final json = {
        'id': 2,
        'price': 29.99,
        'title': 'Product 2',
        'description': 'Another product',
        'category': 'Home & Kitchen',
        'image': 'product_image2.jpg',
        'rating': {'rate': 3.8, 'count': 50},
      };
      final product = Product.fromJson(json);

      expect(product.id, equals(2));
      expect(product.price, equals(29.99));
      expect(product.title, equals('Product 2'));
      expect(product.description, equals('Another product'));
      expect(product.category, equals('Home & Kitchen'));
      expect(product.image, equals('product_image2.jpg'));
      expect(product.rating.rate, equals(3.8));
      expect(product.rating.count, equals(50));
    });

    test('Should create a Product object with default values', () {
      const product = Product(
        id: 0,
        price: 0.0,
        title: '',
        description: '',
        category: '',
        image: '',
        rating: Rating(rate: 0.0, count: 0),
      );

      expect(product.id, equals(0));
      expect(product.price, equals(0.0));
      expect(product.title, equals(''));
      expect(product.description, equals(''));
      expect(product.category, equals(''));
      expect(product.image, equals(''));
      expect(product.rating.rate, equals(0.0));
      expect(product.rating.count, equals(0));
    });
  });
}
