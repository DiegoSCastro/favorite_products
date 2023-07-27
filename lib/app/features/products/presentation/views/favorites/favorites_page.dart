import 'package:flutter/material.dart';

import '../../../../../app.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final controller = sl<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ValueListenableBuilder<HomeState>(
        valueListenable: controller,
        builder: (_, state, __) {
          if (state is HomeSuccess) {
            return CustomPlaceholder(
              showPlaceholder: state.favorites.isEmpty,
              svgPicture: context.assets.emptyListPlaceholder,
              message: 'The list is empty',
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final product = state.favorites[index];
                  return ProductItem(
                    product: product,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          product: product,
                        ),
                      ),
                    ),
                    showFavoriteIcon: false,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: context.colors.lighterGray,
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
