import 'package:ecommerce_app/domain/usecase/login_use_case.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  TextEditingController passwordController =
      TextEditingController(text: "Ahmed@123");
  TextEditingController emailController =
      TextEditingController(text: "maoataz404@gmail.com");
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((error) {
        emit(LoginErrorState(error: error));
      }, (response) {
        emit(LoginSuccessState(responseEntity: response));
      });
    }
  }
}