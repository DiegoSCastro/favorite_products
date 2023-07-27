import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => blue;
  Color get secondary => tangoNormal;
  Color get blue => const Color(0XFF3366CC);
  Color get red => const Color(0XFFFF0000);
  Color get yellow => const Color(0XFFFFD700);
  Color get tangoNormal => const Color(0XFFF37A20);
  Color get green => const Color(0XFF5EC401);
  Color get blackNormal => const Color(0XFF37474F);
  Color get blackMedium => const Color(0XFF37474F).withOpacity(0.72);
  Color get lightGray => const Color(0XFFF0F1F2);
  Color get lighterGray => const Color(0XFFF0F0F0);
  Color get white => const Color(0XFFFFFFFF);
}

extension AppColorsExtensions on BuildContext {
  AppColors get colors => AppColors.i;
}
