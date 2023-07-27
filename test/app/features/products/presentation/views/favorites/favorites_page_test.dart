import 'dart:io';

import 'package:favorite_products/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeController extends Mock implements HomeController {}

void main() {
  GetIt getIt = GetIt.instance;
  setUpAll(() => HttpOverrides.global = null);

  setUp(() {
    getIt.reset();
  });

  testWidgets('FavoritesPage should display favorite products correctly',
      (WidgetTester tester) async {
    final favoriteProducts = [
      const Product(
        id: 1,
        price: 19.99,
        title: 'Test Product 1',
        description: 'This is test product 1',
        category: 'Test Category 1',
        image: 'https://example.com/image1.jpg',
        rating: Rating(rate: 4.5, count: 100),
      ),
      const Product(
        id: 2,
        price: 29.99,
        title: 'Test Product 2',
        description: 'This is test product 2',
        category: 'Test Category 2',
        image: 'https://example.com/image2.jpg',
        rating: Rating(rate: 4.8, count: 150),
      ),
    ];

    final mockHomeController = MockHomeController();
    when(() => mockHomeController.value)
        .thenReturn(HomeSuccess(products: [], favorites: favoriteProducts));

    getIt.registerSingleton<HomeController>(mockHomeController);

    await tester.pumpWidget(
      const MaterialApp(
        home: FavoritesPage(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Favorites'), findsOneWidget);

    expect(find.byType(ProductItem), findsNWidgets(favoriteProducts.length));
    expect(find.text('Test Product 1'), findsOneWidget);
    expect(find.text('Test Product 2'), findsOneWidget);
    expect(find.byType(Divider), findsWidgets);
  });

  testWidgets('FavoritesPage should display empty list placeholder',
      (WidgetTester tester) async {
    final mockHomeController = MockHomeController();
    when(() => mockHomeController.value)
        .thenReturn(HomeSuccess(products: [], favorites: []));

    getIt.registerSingleton<HomeController>(mockHomeController);

    await tester.pumpWidget(
      const MaterialApp(
        home: FavoritesPage(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('The list is empty'), findsOneWidget);

    expect(find.byType(CustomPlaceholder), findsOneWidget);
  });
}
