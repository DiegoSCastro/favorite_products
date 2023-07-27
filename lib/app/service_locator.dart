import 'package:get_it/get_it.dart';

import 'app.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl.registerLazySingleton<CustomDio>(() => CustomDio());
  sl.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

  sl.registerLazySingleton<ProductsRemoteDatasource>(
    () => ProductsRemoteDatasourceImpl(
      dio: sl<CustomDio>(),
    ),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductsRepositoryImpl(
      datasource: sl<ProductsRemoteDatasource>(),
    ),
  );
  sl.registerLazySingleton<GetProductsUsecase>(
    () => GetProductsUsecaseImpl(
      repository: sl<ProductRepository>(),
    ),
  );
  sl.registerLazySingleton<HomeController>(
    () => HomeController(
      getProductsUsecase: sl<GetProductsUsecase>(),
      localStorage: sl<LocalStorage>(),
    ),
  );
}
