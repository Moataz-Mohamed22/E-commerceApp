import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';

sealed class FavoriteStates {}
class FavoriteInitialState extends FavoriteStates {}
class FavoriteUpDateState extends FavoriteStates {
  final List<ProductEntity>favoriteProducts ;
  FavoriteUpDateState(this.favoriteProducts);
}