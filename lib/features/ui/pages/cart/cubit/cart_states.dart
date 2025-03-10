import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/Get_cart_response_entity.dart';

abstract class CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {
  final GetCartResponseEntity responseEntity;
  GetCartSuccessState({required this.responseEntity});
}

class GetCartErrorState extends CartStates {
  final Failures failures;
  GetCartErrorState({required this.failures});
}

class DeleteCartLoadingState extends CartStates {}

class DeleteCartSuccessState extends CartStates {
  final GetCartResponseEntity responseEntity;
  DeleteCartSuccessState({required this.responseEntity});
}

class DeleteCartErrorState extends CartStates {
  final Failures failures;
  DeleteCartErrorState({required this.failures});
}
