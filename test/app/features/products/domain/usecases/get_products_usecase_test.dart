// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:favorite_products/app/app.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late GetProductsUsecaseImpl usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = GetProductsUsecaseImpl(repository: mockRepository);
  });

  test('GetProductsUsecaseImpl should call repository and return products', () async {
    final products = [
      const Product(id: 1, price: 19.99, title: 'Product 1', description: '', category: '', image: '', rating: Rating(rate: 5, count: 10)),
      const Product(id: 2, price: 24.99, title: 'Product 2', description: '', category: '', image: '', rating: Rating(rate: 4.5, count: 8)),
    ];
    when(() => mockRepository.getProducts()).thenAnswer((_) async => Right(products));

    final result = await usecase.call();

    expect(result, equals(Right(products)));
    verify(() => mockRepository.getProducts()).called(1);
  });

  test('GetProductsUsecaseImpl should return an error if repository fails', () async {
    final exception = Exception('Something went wrong');
    when(() => mockRepository.getProducts()).thenAnswer((_) async => Left(exception));

    final result = await usecase.call();

    expect(result, equals(Left(exception)));
    verify(() => mockRepository.getProducts()).called(1);
  });
}
