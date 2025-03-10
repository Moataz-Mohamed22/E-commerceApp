import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/Get_cart_response_entity.dart';

abstract class CartRepository {
 Future<Either<Failures ,GetCartResponseEntity>> getItemInCart ();
 Future<Either<Failures ,GetCartResponseEntity>> deleteItemInCart (String productId);
}