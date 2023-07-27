import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../../../app.dart';

class HomeController extends ValueNotifier<HomeState> {
  final GetProductsUsecase getProductsUsecase;
  final LocalStorage localStorage;
  HomeController({
    required this.getProductsUsecase,
    required this.localStorage,
  }) : super(HomeInitial());

  Future<void> fetchData() async => getProducts().then((_) => loadFavorites());

  Future<void> getProducts() async {
    value = HomeLoading();
    final result = await getProductsUsecase();
    result.fold(
      (error) => value = HomeError(errorMessage: 'Something went wrong!'),
      (products) {
        value = HomeSuccess(products: products, favorites: []);
      },
    );
  }

  void setSearchText(String v) {
    if (value is HomeSuccess) {
      (value as HomeSuccess).searchText = v;
    }
  }

  List<Product> get _favorites {
    if (value is HomeSuccess) {
      return (value as HomeSuccess).favorites;
    }
    return [];
  }

  void toggleFavorite(Product product) {
    if (value is HomeSuccess) {
      final favorites = _favorites;
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
      value = HomeSuccess(
        products: (value as HomeSuccess).products,
        favorites: favorites,
        searchText: (value as HomeSuccess).searchText,
      );
      saveFavorites();
    }
  }

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }

  void saveFavorites() async {
    if (value is HomeSuccess) {
      final List<String> items =
          _favorites.map((e) => jsonEncode(e.toJson())).toList();
      await localStorage.write(HomeConstants.favorites, items);
    }
  }

  Future<List<Product>> loadFavoritesFromStorage() async {
    final storageFavorites =
        await localStorage.read<List<String>>(HomeConstants.favorites);

    return storageFavorites
            ?.map((item) => Product.fromJson(jsonDecode(item)))
            .toList() ??
        [];
  }

  void updateFavorites(List<Product> favorites) {
    if (value is HomeSuccess) {
      value = HomeSuccess(
          products: (value as HomeSuccess).products, favorites: favorites);
    }
  }

  void loadFavorites() async {
    if (value is HomeSuccess) {
      final favorites = await loadFavoritesFromStorage();
      updateFavorites(favorites);
    }
  }
}
