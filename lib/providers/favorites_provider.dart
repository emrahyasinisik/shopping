import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/product.dart';

class FavoriteProductNotifier extends StateNotifier<List<Product>> {
  FavoriteProductNotifier() : super([]);
  void toggleProductFavorite(Product product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }
}

final favoriteProductProvider =
    StateNotifierProvider<FavoriteProductNotifier, List<Product>>(
        (ref) => FavoriteProductNotifier());
