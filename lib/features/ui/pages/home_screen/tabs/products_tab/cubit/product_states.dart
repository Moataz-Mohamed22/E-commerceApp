import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/add_cart_response_entity.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductErrorState extends ProductStates {
  Failures failures;

  ProductErrorState({required this.failures});
}

class ProductSuccessState extends ProductStates {
  ProductResponseEntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}class AddCartLoadingState extends ProductStates {}

class AddCartErrorState extends ProductStates {
  Failures failures;

  AddCartErrorState({required this.failures});
}

class AddCartSuccessState extends ProductStates {
  AddCartResponseEntity addCartResponseEntity;

  AddCartSuccessState({required this.addCartResponseEntity});
}