import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class AuthRemotelyDataSource{
  Future<Either<Failures,RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      );

  Future<Either<Failures, LoginResponseEntity>> login(
    String email,
    String password,
  );
}