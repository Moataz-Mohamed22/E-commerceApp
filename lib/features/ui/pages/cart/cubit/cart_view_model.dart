import 'package:ecommerce_app/domain/usecase/Delete_items_in_cart_use_case.dart';
import 'package:ecommerce_app/domain/usecase/Get_items_in_cart_use_case.dart';
import 'package:ecommerce_app/features/ui/pages/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/Get_cart_response_entity.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  List<GetProductEntity> productList = [];
  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);

  final GetItemsInCartUseCase getItemsInCartUseCase;
  final DeleteItemsInCartUseCase deleteItemsInCartUseCase;

  CartViewModel({
    required this.getItemsInCartUseCase,
    required this.deleteItemsInCartUseCase,
  }) : super(GetCartLoadingState());

  void getItemsInCart() async {
    emit(GetCartLoadingState());
    var either = await getItemsInCartUseCase.invoke();
    either.fold(
          (error) => emit(GetCartErrorState(failures: error)),
          (response) {
        productList = response.data?.products ?? [];
        emit(GetCartSuccessState(responseEntity: response));
      },
    );
  }

  void deleteItemsInCart(String productId) async {

    var either = await deleteItemsInCartUseCase.invoke(productId);
    either.fold(
          (error) => emit(DeleteCartErrorState(failures: error)),
          (response) {
        productList = response.data?.products ?? [];
        emit(DeleteCartSuccessState(responseEntity: response));
      },
    );
  }
}

