import 'package:flutter/material.dart';

import '../../../../../app.dart';

class DetailsPage extends StatefulWidget {
  final Product product;
  const DetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = sl<HomeController>();

  bool get isFavorite => controller.isFavorite(widget.product);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ValueListenableBuilder<HomeState>(
                valueListenable: controller,
                builder: (_, state, __) {
                  return IconButton(
                    onPressed: () {
                      controller.toggleFavorite(widget.product);
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? context.colors.red : context.colors.blackMedium,
                    ),
                  );
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 45,
                left: 45,
                top: 10,
                bottom: 18,
              ),
              child: Image.network(
                widget.product.image,
                width: MediaQuery.sizeOf(context).width,
                height: 310,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: context.text.h6Medium,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: context.colors.yellow,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${widget.product.rating.rate} (${widget.product.rating.count} reviews)',
                          style: context.text.body2SemiBold
                              .copyWith(color: context.colors.blackMedium),
                        ),
                      ),
                      Text(
                        widget.product.price.toCurrency(),
                        style: context.text.h5Bold.copyWith(color: context.colors.green),
                      )
                    ],
                  ),
                  const SizedBox(height: 26),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.sort),
                      ),
                      Expanded(
                        child: Text(
                          widget.product.category,
                          style: context.text.body1Medium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.menu),
                      ),
                      Expanded(
                        child: Text(
                          widget.product.description,
                          style: context.text.body1Medium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
