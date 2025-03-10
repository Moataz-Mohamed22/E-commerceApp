import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/Get_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/data_source/remote_data_source/cart_remote_data_source.dart';
import 'package:ecommerce_app/domain/repositories/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CartRepository )
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource ;
  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getItemInCart()async {
  var either = await  cartRemoteDataSource.getItemInCart();
  return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId) async{
    var either = await  cartRemoteDataSource.deleteItemInCart(productId);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}