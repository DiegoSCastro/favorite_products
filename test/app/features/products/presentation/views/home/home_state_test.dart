import 'package:favorite_products/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HomeInitial should be an instance of HomeState', () {
    final state = HomeInitial();
    expect(state, isA<HomeState>());
  });

  test('HomeLoading should be an instance of HomeState', () {
    final state = HomeLoading();
    expect(state, isA<HomeState>());
  });

  test('HomeSuccess should be an instance of HomeState', () {
    final state = HomeSuccess(products: [], favorites: [], searchText: '');
    expect(state, isA<HomeState>());
  });

  test('HomeError should be an instance of HomeState', () {
    final state = HomeError(errorMessage: 'Error message');
    expect(state, isA<HomeState>());
  });

  test('HomeSuccess should show filtered products', () {
    const product1 = Product(
      id: 1,
      price: 19.99,
      title: 'Product One',
      description: 'Product One description',
      category: 'Category 1',
      image: 'image_url_1',
      rating: Rating(rate: 4.5, count: 100),
    );
    const product2 = Product(
      id: 2,
      price: 29.99,
      title: 'Product Two',
      description: 'Product Two description',
      category: 'Category 2',
      image: 'image_url_2',
      rating: Rating(rate: 3.8, count: 50),
    );
    const searchText = 'product';

    final state = HomeSuccess(products: [product1, product2], favorites: [], searchText: searchText);

    expect(state.showProducts, contains(product1));
    expect(state.showProducts, contains(product2));
  });
}
