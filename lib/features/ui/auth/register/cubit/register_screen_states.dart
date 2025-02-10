import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{
  Failures error;
  RegisterErrorState({required this.error});
}

class RegisterSuccessState extends RegisterStates{
  RegisterResponseEntity responseEntity;
  RegisterSuccessState({required this.responseEntity});
}