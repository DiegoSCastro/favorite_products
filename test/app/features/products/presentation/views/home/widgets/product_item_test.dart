import 'dart:io';

import 'package:favorite_products/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('ProductItem should display correct information',
      (WidgetTester tester) async {
    const product = Product(
      id: 1,
      price: 19.99,
      title: 'Test Product',
      description: 'This is a test product',
      category: 'Test Category',
      image:
          'https://example.com/test_image.jpg',
      rating: Rating(rate: 4.5, count: 100),
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: ProductItem(
            product: product,
            showFavoriteIcon: true,
            isFavorite: false,
          ),
        ),
      ),
    );

    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('4.5 (100 reviews)'), findsOneWidget);
    expect(find.text('\$19.99'), findsOneWidget);

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    await tester.pumpAndSettle();
  });


  testWidgets('ProductItem should display correct favorite icon',
      (WidgetTester tester) async {
    const product = Product(
      id: 1,
      price: 19.99,
      title: 'Test Product',
      description: 'This is a test product',
      category: 'Test Category',
      image:
          'https://example.com/test_image.jpg', 
      rating: Rating(rate: 4.5, count: 100),
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: ProductItem(
            product: product,
            showFavoriteIcon: true,
            isFavorite: true,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('ProductItem should not display favorite icon',
      (WidgetTester tester) async {
    const product = Product(
      id: 1,
      price: 19.99,
      title: 'Test Product',
      description: 'This is a test product',
      category: 'Test Category',
      image:
          'https://example.com/test_image.jpg', 
      rating: Rating(rate: 4.5, count: 100),
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: ProductItem(
            product: product,
            showFavoriteIcon: false,
            isFavorite: false,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.favorite_border), findsNothing);
  });
}
