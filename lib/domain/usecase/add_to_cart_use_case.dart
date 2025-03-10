import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/add_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/failures/failures.dart';
import '../entities/CategoryOrBrandResponseEntity.dart';

@injectable
class AddToCartUseCase {
 HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId) {
    return  homeRepository.addToCart(productId);
  }
}
