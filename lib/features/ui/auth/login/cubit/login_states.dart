import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';

import '../../../../../core/failures/failures.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures error;

  LoginErrorState({required this.error});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity responseEntity;

  LoginSuccessState({required this.responseEntity});
}