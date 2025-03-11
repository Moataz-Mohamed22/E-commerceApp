import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../domain/entities/ProductResponseEntity.dart';

class FavoriteViewModel extends Cubit<FavoriteStates> {
  FavoriteViewModel():super(FavoriteInitialState());
  List<ProductEntity> favoriteProducts = [];


  void addToFavorite(ProductEntity product) {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
      emit(FavoriteUpDateState(List.from(favoriteProducts)));
    }
  }

  void removeFromFavorite(String productId) {
    favoriteProducts.removeWhere((product) => product.id == productId);
    emit(FavoriteUpDateState(List.from(favoriteProducts)));
  }
}
