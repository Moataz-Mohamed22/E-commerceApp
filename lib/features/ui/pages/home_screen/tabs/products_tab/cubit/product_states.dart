import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';

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
}