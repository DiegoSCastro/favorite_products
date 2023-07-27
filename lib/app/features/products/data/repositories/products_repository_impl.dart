import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../app.dart';

class ProductsRepositoryImpl implements ProductRepository {
  final ProductsRemoteDatasource _datasource;

  ProductsRepositoryImpl({required ProductsRemoteDatasource datasource}) : _datasource = datasource;
  @override
  Future<Either<Exception, List<Product>>> getProducts() async {
    try {
      final response = await _datasource.getProducts();
      final products = response.map<Product>((e) => e.toEntity()).toList();

      return Right(products);
    } on DioException catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(DioException(message: e.toString()));
    } on TimeoutException catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(TimeoutException(message: e.toString()));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(Exception(e.toString()));
    }
  }
}
