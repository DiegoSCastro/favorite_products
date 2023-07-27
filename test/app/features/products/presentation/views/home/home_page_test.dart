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
    // Crie o mock do HomeController e configure o comportamento do método value
    final mockHomeController = MockHomeController();
    when(() => mockHomeController.value).thenReturn(HomeInitial());

    // Configurar o comportamento do método fetchData
    when(() => mockHomeController.fetchData())
        .thenAnswer((_) => Future.value());

    // Registre o mock do HomeController no GetIt
    getIt.registerSingleton<HomeController>(mockHomeController);

    // Construa o widget HomePage com o MaterialApp para os testes
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    // Verifique se o CircularProgressIndicator é exibido corretamente
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'HomePage should display CircularProgressIndicator when HomeLoading',
      (WidgetTester tester) async {
    // Crie o mock do HomeController e configure o comportamento do método value
    final mockHomeController = MockHomeController();
    when(() => mockHomeController.value).thenReturn(HomeLoading());
    // Configurar o comportamento do método fetchData
    when(() => mockHomeController.fetchData())
        .thenAnswer((_) => Future.value());

    // Registre o mock do HomeController no GetIt
    getIt.registerSingleton<HomeController>(mockHomeController);

    // Construa o widget HomePage com o MaterialApp para os testes
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    // Verifique se o CircularProgressIndicator é exibido corretamente
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('HomePage should display HomeErrorLayout when HomeError',
      (WidgetTester tester) async {
    // Crie o mock do HomeController e configure o comportamento do método value
    final mockHomeController = MockHomeController();
    when(() => mockHomeController.value)
        .thenReturn(HomeError(errorMessage: 'error'));
    when(() => mockHomeController.fetchData())
        .thenAnswer((_) => Future.value());

    // Registre o mock do HomeController no GetIt
    getIt.registerSingleton<HomeController>(mockHomeController);

    // Construa o widget HomePage com o MaterialApp para os testes
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    // Verifique se o HomeErrorLayout é exibido corretamente
    expect(find.byType(HomeErrorLayout), findsOneWidget);
  });
}
