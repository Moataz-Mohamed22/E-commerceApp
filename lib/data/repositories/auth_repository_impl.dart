import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app/domain/repositories/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/repositories/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemotelyDataSource authRemotelyDataSource;
  AuthRepositoryImpl({required this.authRemotelyDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name, String email, String password, String rePassword, String phone) async{
    var either = await authRemotelyDataSource.register(name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await authRemotelyDataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}