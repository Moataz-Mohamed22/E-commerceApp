import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce_app/domain/usecase/get_all_brands_use_case.dart';
import 'package:ecommerce_app/domain/usecase/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/home_tab_cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());
  List<CategoryOrBrandEntity> categoryList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.execute();
    either.fold((error) {
      emit(CategoryErrorState(failures: error));
    }, (response) {
      categoryList = response.data!;
      emit(CategorySuccessState(categoryResponseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandsUseCase.execute();
    either.fold((error) {
      emit(BrandErrorState(failures: error));
    }, (response) {
      brandsList = response.data!;
      emit(BrandSuccessState(categoryResponseEntity: response));
    });
  }
}
