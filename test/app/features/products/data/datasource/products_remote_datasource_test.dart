import 'package:dio/dio.dart';
import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomDio extends Mock implements CustomDio {}

void main() {
  group('ProductsRemoteDatasourceImpl', () {
    late ProductsRemoteDatasourceImpl remoteDatasource;
    late MockCustomDio mockDio;

    setUp(() {
      mockDio = MockCustomDio();
      remoteDatasource = ProductsRemoteDatasourceImpl(dio: mockDio);
    });

    test('getProducts should return a list of ProductModel on success',
        () async {
      final jsonResponse = [
        {
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
        },
        {
          'id': 2,
          'price': 29.99,
          'title': 'Product 2',
          'description': 'Description 2',
          'category': 'Category 2',
          'image': 'product_image2.jpg',
          'rating': {
            'rate': 4.2,
            'count': 75,
          },
        },
      ];
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
          data: jsonResponse,
          statusCode: 200,
          requestOptions: RequestOptions()));

      final products = await remoteDatasource.getProducts();

      expect(products.length, equals(2));
      expect(products[0].id, equals(1));
      expect(products[0].title, equals('Product 1'));
      expect(products[0].price, equals(19.99));
      expect(products[0].description, equals('Description 1'));
      expect(products[0].category, equals('Category 1'));
      expect(products[0].image, equals('product_image1.jpg'));
      expect(products[0].rating.rate, equals(4.5));
      expect(products[0].rating.count, equals(100));
    });
  });
}
