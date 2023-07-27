import 'package:favorite_products/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomSearchField should render correctly',
      (WidgetTester tester) async {
    String? searchText;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomSearchField(
            onChanged: (text) {
              searchText = text;
            },
          ),
        ),
      ),
    );

    expect(find.byType(TextFormField), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'Test Text');

    expect(searchText, equals('Test Text'));
  });
}
