import 'package:ecommerce_app/domain/usecase/register_use_case.dart';
import 'package:ecommerce_app/features/ui/auth/register/cubit/register_screen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      :super(RegisterInitialState());

  TextEditingController fullNameController = TextEditingController(text: "Ahmed Fayed");
  TextEditingController passwordController = TextEditingController(text: "Ahmedfayed@55");
  TextEditingController rePasswordController = TextEditingController(text: "Ahmedfayed@55");
  TextEditingController phoneController = TextEditingController(text: "01096640218");
  TextEditingController emailController = TextEditingController(text: "ahmedfaid542@gmail.com");
  var formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          fullNameController.text, emailController.text,
          passwordController.text, rePasswordController.text,
          phoneController.text);
      either.fold((error) {
        emit(RegisterErrorState(error: error));
      },
              (response) {
            emit(RegisterSuccessState(responseEntity: response));
          });
    }
  }
}