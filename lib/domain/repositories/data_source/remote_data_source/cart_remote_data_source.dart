import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../entities/Get_cart_response_entity.dart';



abstract class CartRemoteDataSource {
  Future<Either<Failures ,GetCartResponseEntity>> getItemInCart ();
  Future<Either<Failures ,GetCartResponseEntity>> deleteItemInCart (String productId);


}