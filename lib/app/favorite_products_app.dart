import 'package:flutter/material.dart';

import 'app.dart';

class FavoriteProductsApp extends StatelessWidget {
  const FavoriteProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Products',
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
