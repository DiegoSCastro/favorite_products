import 'package:favorite_products/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeErrorLayout should render correctly', (WidgetTester tester) async {
    bool onTapButtonCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: HomeErrorLayout(
          onTapButton: () {
            onTapButtonCalled = true;
          },
        ),
      ),
    );

    expect(find.text('Something went wrong!'), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(onTapButtonCalled, isTrue);
  });
}
