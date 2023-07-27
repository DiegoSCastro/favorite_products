import 'package:dartz/dartz.dart';
import 'package:favorite_products/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

class MockGetProductsUseCase extends Mock implements GetProductsUsecase {}

void main() {
  GetIt getIt = GetIt.instance;

  final mockLocalStorage = MockLocalStorage();
  when(() => mockLocalStorage.read<List<String>>(any())).thenAnswer((_) async => <String>[]);

  final mockGetProductsUseCase = MockGetProductsUseCase();
  when(() => mockGetProductsUseCase.call()).thenAnswer((_) async => const Right([]));

  getIt.registerSingleton<HomeController>(
    HomeController(
      localStorage: mockLocalStorage,
      getProductsUsecase: mockGetProductsUseCase,
    ),
  );

  testWidgets(
    'FavoriteProductsApp should render correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(const FavoriteProductsApp());

      expect(find.byType(MaterialApp), findsOneWidget);

      expect(find.byType(HomePage), findsOneWidget);
    },
  );
}
