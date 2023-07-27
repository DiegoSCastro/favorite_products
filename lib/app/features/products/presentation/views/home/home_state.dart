import '../../../../../app.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Product> products;
  List<Product> favorites;
  String searchText;

  HomeSuccess({
    required this.products,
    required this.favorites,
    this.searchText = '',
  });
  List<Product> get showProducts => List<Product>.from(products)
      .where(
        (e) => e.title.withoutDiacriticalLowerCase
            .contains(searchText.withoutDiacriticalLowerCase),
      )
      .toList();
}

final class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}
