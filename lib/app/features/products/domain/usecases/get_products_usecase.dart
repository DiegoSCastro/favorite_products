import 'package:dartz/dartz.dart';

import '../../../../app.dart';

abstract interface class GetProductsUsecase {
  Future<Either<Exception, List<Product>>> call();
}

class GetProductsUsecaseImpl implements GetProductsUsecase {
  final ProductRepository _repository;

  GetProductsUsecaseImpl({required ProductRepository repository}) : _repository = repository;
  @override
  Future<Either<Exception, List<Product>>> call() {
    return _repository.getProducts();
  }
}
