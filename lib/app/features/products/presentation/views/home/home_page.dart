import 'package:flutter/material.dart';

import '../../../../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = sl<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: ValueListenableBuilder<HomeState>(
        valueListenable: controller,
        builder: (_, state, __) {
          return switch (state) {
            HomeInitial() => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            HomeLoading() => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            HomeError() => Scaffold(
                body: HomeErrorLayout(
                  onTapButton: controller.fetchData,
                ),
              ),
            HomeSuccess() => Scaffold(
                appBar: AppBar(
                  title: const Text('Products'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FavoritesPage(),
                          ),
                        );

                        FocusScope.of(context).unfocus();
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    const SizedBox(height: 18),
                    CustomSearchField(
                      onChanged: (v) {
                        controller.setSearchText(v);
                        setState(() {});
                      },
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          return CustomPlaceholder(
                            showPlaceholder: state.showProducts.isEmpty,
                            svgPicture: context.assets.emptyListPlaceholder,
                            message: 'The list is empty',
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: state.showProducts.length,
                              itemBuilder: (context, index) {
                                final product = state.showProducts[index];
                                return ProductItem(
                                  product: product,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                          product: product,
                                        ),
                                      ),
                                    );
                                    FocusScope.of(context).unfocus();
                                  },
                                  onTapFavorite: () {
                                    controller.toggleFavorite(product);
                                  },
                                  isFavorite: controller.isFavorite(product),
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
                        },
                      ),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
