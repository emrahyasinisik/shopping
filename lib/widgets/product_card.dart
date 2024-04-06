import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/providers/favorites_provider.dart';

class ProductCard extends ConsumerStatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteProductProvider);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.product.imageUrl,
                          fit: BoxFit.cover,
                          height: 250,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(74, 158, 158, 158),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  onTap: () {
                                    ref
                                        .read(favoriteProductProvider.notifier)
                                        .toggleProductFavorite(widget.product);
                                  },
                                  child: Icon(
                                    favorites.contains(widget.product)
                                        ? Icons.shopping_bag
                                        : Icons.shopping_bag_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.product.productName),
            Text("\$${widget.product.price.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
