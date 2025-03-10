// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../data/data_source/remote_data_source/auth_remote_data_source_impl.dart'
    as _i175;
import '../data/data_source/remote_data_source/cart_remote_data_source_impl.dart'
    as _i267;
import '../data/data_source/remote_data_source/home_remote_data_source_impl.dart'
    as _i604;
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/cart_repository_impl.dart';
import '../data/repositories/home_repository_impl.dart' as _i158;
import '../domain/repositories/data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i273;
import '../domain/repositories/data_source/auth_remote_data_source/home_remote_data_source.dart'
    as _i188;
import '../domain/repositories/data_source/remote_data_source/cart_remote_data_source.dart'
    as _i129;
import '../domain/repositories/repository/auth_repository.dart' as _i555;
import '../domain/repositories/repository/cart/cart_repository.dart';
import '../domain/repositories/repository/home_repository.dart' as _i745;
import '../domain/usecase/add_to_cart_use_case.dart' as _i127;
import '../domain/usecase/Delete_items_in_cart_use_case.dart' as _i576;
import '../domain/usecase/get_all_brands_use_case.dart' as _i417;
import '../domain/usecase/get_all_categories_use_case.dart' as _i241;
import '../domain/usecase/get_all_products_use_case.dart' as _i867;
import '../domain/usecase/Get_items_in_cart_use_case.dart' as _i283;
import '../domain/usecase/login_use_case.dart' as _i374;
import '../domain/usecase/register_use_case.dart' as _i491;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_screen_view_model.dart'
    as _i271;
import '../features/ui/pages/cart/cubit/cart_view_model.dart' as _i888;
import '../features/ui/pages/home_screen/tabs/home_tab/home_tab_cubit/home_tab_view_model.dart'
    as _i184;
import '../features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart'
    as _i499;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i273.AuthRemotelyDataSource>(() =>
        _i175.AuthRemotelyDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i129.CartRemoteDataSource>(() =>
        _i267.CartRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i188.HomeRemoteDataSource>(() =>
        _i604.HomeRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i745.HomeRepository>(() => _i158.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i188.HomeRemoteDataSource>()));
    gh.factory<_i888.CartViewModel>(() => _i888.CartViewModel(
          getItemsInCartUseCase: gh<_i283.GetItemsInCartUseCase>(),
          deleteItemsInCartUseCase: gh<_i576.DeleteItemsInCartUseCase>(),
        ));
    gh.factory<_i127.AddToCartUseCase>(() =>
        _i127.AddToCartUseCase(homeRepository: gh<_i745.HomeRepository>()));
    gh.factory<_i417.GetAllBrandsUseCase>(() =>
        _i417.GetAllBrandsUseCase(homeRepository: gh<_i745.HomeRepository>()));
    gh.factory<_i241.GetAllCategoriesUseCase>(() =>
        _i241.GetAllCategoriesUseCase(
            homeRepository: gh<_i745.HomeRepository>()));
    gh.factory<_i867.GetAllProductsUseCase>(() => _i867.GetAllProductsUseCase(
        homeRepository: gh<_i745.HomeRepository>()));
    gh.factory<CartRepository>(() =>
        CartRepositoryImpl(cartRemoteDataSource: gh<_i129.CartRemoteDataSource>()));
    gh.factory<_i555.AuthRepository>(() => AuthRepositoryImpl(
        authRemotelyDataSource: gh<_i273.AuthRemotelyDataSource>()));
    gh.factory<_i283.GetItemsInCartUseCase>(
        () => _i283.GetItemsInCartUseCase(cartRepository: gh<CartRepository>()));
    gh.factory<_i576.DeleteItemsInCartUseCase>(
        () => _i576.DeleteItemsInCartUseCase(cartRepository: gh<CartRepository>()));
    gh.factory<_i499.ProductTabViewModel>(() => _i499.ProductTabViewModel(
          getAllProductsUseCase: gh<_i867.GetAllProductsUseCase>(),
          addToCartUseCase: gh<_i127.AddToCartUseCase>(),
        ));
    gh.factory<_i184.HomeTabViewModel>(() => _i184.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i241.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i417.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i374.LoginUseCase>(
        () => _i374.LoginUseCase(authRepository: gh<_i555.AuthRepository>()));
    gh.factory<_i491.RegisterUseCase>(() =>
        _i491.RegisterUseCase(authRepository: gh<_i555.AuthRepository>()));
    gh.factory<_i1040.LoginScreenViewModel>(() =>
        _i1040.LoginScreenViewModel(loginUseCase: gh<_i374.LoginUseCase>()));
    gh.factory<_i271.RegisterViewModel>(() =>
        _i271.RegisterViewModel(registerUseCase: gh<_i491.RegisterUseCase>()));
    return this;
  }
}
