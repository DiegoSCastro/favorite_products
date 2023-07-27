import 'package:flutter/material.dart';

import '../../../../../../app.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final bool isFavorite;
  final bool showFavoriteIcon;
  const ProductItem({
    super.key,
    required this.product,
    this.onTap,
    this.onTapFavorite,
    this.showFavoriteIcon = true,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 19,
          right: 16,
          bottom: 22,
          top: 21,
        ),
        child: Row(
          children: [
            Image.network(
              product.image,
              height: 120,
              width: 128,
            ),
            const SizedBox(width: 19),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: context.text.body1Medium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: context.colors.yellow,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${product.rating.rate} (${product.rating.count} reviews)',
                            style: context.text.body2SemiBold
                                .copyWith(color: context.colors.blackMedium),
                          ),
                        ),
                        Visibility(
                          visible: showFavoriteIcon,
                          child: InkWell(
                            onTap: onTapFavorite,
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? context.colors.red : context.colors.blackMedium,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      product.price.toCurrency(),
                      style: context.text.h6SemiBold.copyWith(color: context.colors.tangoNormal),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
