import 'package:favorite_products/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'CustomPlaceholder should display placeholder when showPlaceholder is true',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CustomPlaceholder(
            showPlaceholder: true,
            message: 'The list is empty',
            svgPicture: 'assets/svg/empty_list.svg',
            child: Text('Child Widget'),
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('The list is empty'), findsOneWidget);
      expect(find.text('Child Widget'), findsNothing);
    },
  );

  testWidgets(
    'CustomPlaceholder should display child when showPlaceholder is false',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CustomPlaceholder(
            showPlaceholder: false,
            message: 'The list is empty',
            svgPicture: 'assets/svg/empty_list.svg',
            child: Text('Child Widget'),
          ),
        ),
      );

      expect(find.text('Child Widget'), findsOneWidget);
      expect(find.byType(SvgPicture), findsNothing);
      expect(find.text('The list is empty'), findsNothing);
    },
  );
}
