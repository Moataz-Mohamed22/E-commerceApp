import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';

import '../../../core/failures/failures.dart';

abstract class AuthRepository{
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