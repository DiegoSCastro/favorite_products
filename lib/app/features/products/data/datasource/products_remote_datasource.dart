import '../../../../app.dart';

abstract interface class ProductsRemoteDatasource {
  Future<List<ProductModel>> getProducts();
}

class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource {
  final CustomDio _dio;

  static const _productsUrl = 'products';

  ProductsRemoteDatasourceImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get(_productsUrl);
    if (response.data == null) return [];

    return response.data.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
  }
}
