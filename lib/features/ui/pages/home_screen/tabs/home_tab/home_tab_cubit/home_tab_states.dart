import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategoryErrorState extends HomeTabStates {
  Failures failures;

  CategoryErrorState({required this.failures});
}

class CategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;

  CategorySuccessState({required this.categoryResponseEntity});
}

class BrandLoadingState extends HomeTabStates {}

class BrandErrorState extends HomeTabStates {
  Failures failures;

  BrandErrorState({required this.failures});
}

class BrandSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;

  BrandSuccessState({required this.categoryResponseEntity});
}
