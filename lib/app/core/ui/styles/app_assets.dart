import 'package:flutter/material.dart';

class AppAssets {
  static AppAssets? _instance;
  AppAssets._();

  static AppAssets get i {
    _instance ??= AppAssets._();
    return _instance!;
  }

  String get emptyListPlaceholder => 'assets/svg/empty_list.svg';
  String get errorPlaceholder => 'assets/svg/error.svg';
}

extension AppAssetsExtensions on BuildContext {
  AppAssets get assets => AppAssets.i;
}
