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

  testWidgets(
      'HomePage should display CircularProgressIndicator when HomeInitial',
      (WidgetTester tester) async {
    final mockHomeController = MockHomeController();
    when(() => mockHomeController.value).thenReturn(HomeInitial());

    when(() => mockHomeController.fetchData())
        .thenAnswer((_) => Future.value());

    getIt.registerSingleton<HomeController>(mockHomeController);

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'HomePage should display CircularProgressIndicator when HomeLoading',
      (WidgetTester tester) async {
    final mockHomeController = MockHomeController();
    when(() => mockHomeController.value).thenReturn(HomeLoading());
    when(() => mockHomeController.fetchData())
        .thenAnswer((_) => Future.value());

    getIt.registerSingleton<HomeController>(mockHomeController);

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('HomePage should display HomeErrorLayout when HomeError',
      (WidgetTester tester) async {
    final mockHomeController = MockHomeController();
    when(() => mockHomeController.value)
        .thenReturn(HomeError(errorMessage: 'error'));
    when(() => mockHomeController.fetchData())
        .thenAnswer((_) => Future.value());

    getIt.registerSingleton<HomeController>(mockHomeController);

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byType(HomeErrorLayout), findsOneWidget);
  });
}
