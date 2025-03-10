import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/Get_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetItemsInCartUseCase {
  CartRepository cartRepository ;
  GetItemsInCartUseCase({required this.cartRepository});
Future<Either<Failures , GetCartResponseEntity>>  invoke (){
    return cartRepository.getItemInCart();
  }
}