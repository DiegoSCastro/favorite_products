import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockProductsRemoteDatasource extends Mock
    implements ProductsRemoteDatasource {}

void main() {
  group('ProductsRepositoryImpl', () {
    late ProductsRepositoryImpl productsRepository;
    late MockProductsRemoteDatasource mockDatasource;

    setUp(() {
      mockDatasource = MockProductsRemoteDatasource();
      productsRepository = ProductsRepositoryImpl(datasource: mockDatasource);
    });

    test('getProducts should return a list of products on successful response',
        () async {
      final productModels = [
        const ProductModel(
            id: 1,
            price: 19.99,
            title: 'Product 1',
            description: 'Description 1',
            category: 'Category 1',
            image: 'product_image1.jpg',
            rating: RatingModel(rate: 4.5, count: 100)),
        const ProductModel(
            id: 2,
            price: 29.99,
            title: 'Product 2',
            description: 'Description 2',
            category: 'Category 2',
            image: 'product_image2.jpg',
            rating: RatingModel(rate: 4.2, count: 75)),
      ];
      when(() => mockDatasource.getProducts())
          .thenAnswer((_) async => productModels);

      final result = await productsRepository.getProducts();

      expect(result, isA<Right<Exception, List<Product>>>());
      final products = result.getOrElse(() => []);
      expect(products.length, equals(2));
      expect(products[0].id, equals(1));
      expect(products[1].id, equals(2));
    });

    test('getProducts should return a Left with DioException on Dio failure',
        () async {
      when(() => mockDatasource.getProducts())
          .thenThrow(DioException(message: ''));

      final result = await productsRepository.getProducts();

      expect(result, isA<Left<Exception, List<Product>>>());
      final exception = result.fold((l) => l, (r) => null);
      expect(exception, isA<DioException>());
    });

    test('getProducts should return a Left with TimeoutException on timeout',
        () async {
      when(() => mockDatasource.getProducts())
          .thenThrow(TimeoutException(message: 'Timeout'));

      final result = await productsRepository.getProducts();

      expect(result, isA<Left<Exception, List<Product>>>());
      final exception = result.fold((l) => l, (r) => null);
      expect(exception, isA<TimeoutException>());
    });

    test(
        'getProducts should return a Left with generic Exception on unknown error',
        () async {
      when(() => mockDatasource.getProducts())
          .thenThrow(Exception('Unknown error'));

      final result = await productsRepository.getProducts();

      expect(result, isA<Left<Exception, List<Product>>>());
      final exception = result.fold((l) => l, (r) => null);
      expect(exception, isA<Exception>());
    });
  });
}
