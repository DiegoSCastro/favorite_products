import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProductsUsecase extends Mock implements GetProductsUsecase {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  group('HomeController', () {
    late HomeController homeController;
    late MockGetProductsUsecase mockGetProductsUsecase;
    late MockLocalStorage mockLocalStorage;

    setUp(() {
      mockGetProductsUsecase = MockGetProductsUsecase();
      mockLocalStorage = MockLocalStorage();
      homeController = HomeController(
        getProductsUsecase: mockGetProductsUsecase,
        localStorage: mockLocalStorage,
      );
    });

    test(
        'fetchData should set HomeLoading and then HomeSuccess on successful fetch',
        () async {
      final products = [
        const Product(
            id: 1,
            price: 19.99,
            title: 'Product 1',
            description: '',
            category: '',
            image: '',
            rating: Rating(rate: 5, count: 10))
      ];

      when(() => mockGetProductsUsecase())
          .thenAnswer((_) async => Right(products));

      when(() => mockLocalStorage.read<List<String>>(HomeConstants.favorites))
          .thenAnswer((_) async => []);

      await homeController.fetchData();

      expect(homeController.value, isA<HomeSuccess>());
      expect((homeController.value as HomeSuccess).products, products);
    });

    test('fetchData should set HomeLoading and then HomeError on fetch error',
        () async {
      when(() => mockGetProductsUsecase())
          .thenAnswer((_) async => Left(Exception()));

      await homeController.fetchData();

      expect(homeController.value, isA<HomeError>());
    });

    test('setSearchText should update searchText in HomeSuccess state', () {
      homeController.value =
          HomeSuccess(products: [], favorites: [], searchText: '');

      homeController.setSearchText('test');

      expect((homeController.value as HomeSuccess).searchText, 'test');
    });

    test('toggleFavorite should add product to favorites if not present', () {
      const product = Product(
          id: 1,
          price: 19.99,
          title: 'Product 1',
          description: '',
          category: '',
          image: '',
          rating: Rating(rate: 5, count: 10));
      homeController.value = HomeSuccess(products: [product], favorites: []);

      when(() => mockLocalStorage.write(HomeConstants.favorites, any()))
          .thenAnswer((_) async {});
      homeController.toggleFavorite(product);

      expect((homeController.value as HomeSuccess).favorites, [product]);
    });

    test(
        'toggleFavorite should remove product from favorites if already present',
        () {
      const product = Product(
          id: 1,
          price: 19.99,
          title: 'Product 1',
          description: '',
          category: '',
          image: '',
          rating: Rating(rate: 5, count: 10));
      homeController.value =
          HomeSuccess(products: [product], favorites: [product]);
      when(() => mockLocalStorage.write(HomeConstants.favorites, any()))
          .thenAnswer((_) async {});

      homeController.toggleFavorite(product);

      expect((homeController.value as HomeSuccess).favorites, []);
    });

    test('isFavorite should return true if product is in favorites', () {
      const product = Product(
          id: 1,
          price: 19.99,
          title: 'Product 1',
          description: '',
          category: '',
          image: '',
          rating: Rating(rate: 5, count: 10));
      homeController.value = HomeSuccess(products: [], favorites: [product]);

      expect(homeController.isFavorite(product), isTrue);
    });

    test('isFavorite should return false if product is not in favorites', () {
      const product = Product(
          id: 1,
          price: 19.99,
          title: 'Product 1',
          description: '',
          category: '',
          image: '',
          rating: Rating(rate: 5, count: 10));
      homeController.value = HomeSuccess(products: [], favorites: []);

      expect(homeController.isFavorite(product), isFalse);
    });

    test('saveFavorites should write favorites to local storage', () async {
      const product = Product(
          id: 1,
          price: 19.99,
          title: 'Product 1',
          description: '',
          category: '',
          image: '',
          rating: Rating(rate: 5, count: 10));
      homeController.value = HomeSuccess(products: [], favorites: [product]);

      final expectedJson = jsonEncode(product.toJson());
      when(() =>
              mockLocalStorage.write(HomeConstants.favorites, [expectedJson]))
          .thenAnswer((_) async {});

      homeController.saveFavorites();

      verify(() =>
              mockLocalStorage.write(HomeConstants.favorites, [expectedJson]))
          .called(1);
    });
  });
}
