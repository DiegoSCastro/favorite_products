import 'dart:io';

import 'package:favorite_products/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  group('AppTextStyles', () {
    test('h5Bold should have the correct properties', () {
      final h5BoldStyle = AppTextStyles.i.h5Bold;

      expect(h5BoldStyle.fontFamily, equals('Poppins_700'));
      expect(h5BoldStyle.fontSize, equals(29));
      expect(h5BoldStyle.fontWeight, equals(FontWeight.w700));
      expect(h5BoldStyle.height, equals(1.5));
    });

    test('h6Medium should have the correct properties', () {
      final h6MediumStyle = AppTextStyles.i.h6Medium;

      expect(h6MediumStyle.fontFamily, equals('Poppins_500'));
      expect(h6MediumStyle.fontSize, equals(20));
      expect(h6MediumStyle.fontWeight, equals(FontWeight.w500));
      expect(h6MediumStyle.height, equals(1.5));
    });

    test('h6SemiBold should have the correct properties', () {
      final h6SemiBoldStyle = AppTextStyles.i.h6SemiBold;

      expect(h6SemiBoldStyle.fontFamily, equals('Poppins_600'));
      expect(h6SemiBoldStyle.fontSize, equals(20));
      expect(h6SemiBoldStyle.fontWeight, equals(FontWeight.w600));
      expect(h6SemiBoldStyle.height, equals(1.5));
    });

    test('appBar should have the correct properties', () {
      final appBarStyle = AppTextStyles.i.appBar;

      expect(appBarStyle.fontFamily, equals('Poppins_600'));
      expect(appBarStyle.fontSize, equals(20));
      expect(appBarStyle.fontWeight, equals(FontWeight.w600));
      expect(appBarStyle.height, equals(1.5));
    });

    test('body1 should have the correct properties', () {
      final body1Style = AppTextStyles.i.body1;

      expect(body1Style.fontFamily, equals('Poppins_regular'));
      expect(body1Style.fontSize, equals(16));
      expect(body1Style.fontWeight, equals(FontWeight.w400));
      expect(body1Style.height, equals(1.5));
    });

    test('body1Medium should have the correct properties', () {
      final body1MediumStyle = AppTextStyles.i.body1Medium;

      expect(body1MediumStyle.fontFamily, equals('Poppins_500'));
      expect(body1MediumStyle.fontSize, equals(16));
      expect(body1MediumStyle.fontWeight, equals(FontWeight.w500));
      expect(body1MediumStyle.height, equals(1.5));
      expect(body1MediumStyle.letterSpacing, equals(0.6));
    });

    test('body1SemiBold should have the correct properties', () {
      final body1SemiBoldStyle = AppTextStyles.i.body1SemiBold;

      expect(body1SemiBoldStyle.fontFamily, equals('Poppins_600'));
      expect(body1SemiBoldStyle.fontSize, equals(16));
      expect(body1SemiBoldStyle.fontWeight, equals(FontWeight.w600));
      expect(body1SemiBoldStyle.height, equals(1.06));
    });

    test('body2SemiBold should have the correct properties', () {
      final body2SemiBoldStyle = AppTextStyles.i.body2SemiBold;

      expect(body2SemiBoldStyle.fontFamily, equals('Poppins_600'));
      expect(body2SemiBoldStyle.fontSize, equals(14));
      expect(body2SemiBoldStyle.fontWeight, equals(FontWeight.w600));
      expect(body2SemiBoldStyle.height, equals(1.21));
    });
  });
}
