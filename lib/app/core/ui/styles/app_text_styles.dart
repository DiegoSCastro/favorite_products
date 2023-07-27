import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static AppTextStyles? _instance;
  AppTextStyles._();

  static AppTextStyles get i {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get h5Bold => GoogleFonts.poppins(
        fontSize: 29,
        fontWeight: FontWeight.w700,
        height: 1.5,
      );
  TextStyle get h6Medium => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.5,
      );

  TextStyle get h6SemiBold => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );
  TextStyle get appBar => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );

  TextStyle get body1 => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );
  TextStyle get body1Medium => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.6,
      );
  TextStyle get body1SemiBold => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.06,
      );
  TextStyle get body2SemiBold => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.21,
      );
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get text => AppTextStyles.i;
}
