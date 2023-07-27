import 'app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppEnv.i.load(env: '.env.dev');
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  runApp(const FavoriteProductsApp());
}
