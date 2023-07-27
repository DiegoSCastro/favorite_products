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

  testWidgets('DetailsPage should display product details and favorite icon correctly',
      (WidgetTester tester) async {
    const product = Product(
      id: 1,
      price: 19.99,
      title: 'Test Product',
      description: 'This is a test product',
      category: 'Test Category',
      image: 'https://example.com/test_image.jpg',
      rating: Rating(rate: 4.5, count: 100),
    );

    final mockHomeController = MockHomeController();
    when(() => mockHomeController.isFavorite(product)).thenReturn(true);
    when(() => mockHomeController.value).thenReturn(HomeSuccess(products: [], favorites: []));

    getIt.registerSingleton<HomeController>(mockHomeController);

    await tester.pumpWidget(
      const MaterialApp(
        home: DetailsPage(product: product),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Product Details'), findsOneWidget);
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('This is a test product'), findsOneWidget);
    expect(find.text('Test Category'), findsOneWidget);
    expect(find.text('4.5 (100 reviews)'), findsOneWidget);

    expect(find.text('\$19.99'), findsOneWidget);

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
