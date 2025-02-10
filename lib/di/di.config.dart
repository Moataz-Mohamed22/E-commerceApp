// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/data/repositories/auth_repository_impl.dart';
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../core/api/api_manager.dart';
import '../data/data_source/remote_data_source/auth_remote_data_source_impl.dart'
    as _i175;
import '../domain/repositories/data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i273;
import '../domain/repositories/repository/auth_repository.dart' as _i555;
import '../domain/usecase/register_use_case.dart' as _i491;
import '../features/ui/auth/register/cubit/register_screen_view_model.dart'
    as _i271;

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
    gh.singleton<ApiManager>(() => ApiManager());
    gh.factory<_i273.AuthRemotelyDataSource>(() =>
        _i175.AuthRemotelyDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i555.AuthRepository>(() => AuthRepositoryImpl(
        authRemotelyDataSource: gh<_i273.AuthRemotelyDataSource>()));
    gh.factory<_i491.RegisterUseCase>(() =>
        _i491.RegisterUseCase(authRepository: gh<_i555.AuthRepository>()));
    gh.factory<_i271.RegisterViewModel>(() =>
        _i271.RegisterViewModel(registerUseCase: gh<_i491.RegisterUseCase>()));
    return this;
  }
}
