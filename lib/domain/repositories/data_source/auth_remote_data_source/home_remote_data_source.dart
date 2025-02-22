import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';

import '../../../entities/ProductResponseEntity.dart';
import '../../../entities/add_cart_response_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);

}
