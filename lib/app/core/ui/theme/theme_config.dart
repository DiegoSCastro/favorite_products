import 'package:flutter/material.dart';

import '../../../app.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.i.primary,
    ),
    scaffoldBackgroundColor: AppColors.i.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.i.white,
      elevation: 0,
      titleTextStyle: AppTextStyles.i.appBar.copyWith(
        color: AppColors.i.blackNormal,
      ),
      iconTheme: IconThemeData(
        color: AppColors.i.blackNormal,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.i.blackNormal,
      ),
    ),
  );
}
