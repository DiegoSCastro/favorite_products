import 'package:dartz/dartz.dart';
import '../../../../app.dart';

abstract interface class ProductRepository {
  Future<Either<Exception, List<Product>>> getProducts();
}
