import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';

class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({
    super.message,
    super.user,
    super.token,
  });

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserLoginDm.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserLoginDm extends UserLoginEntity {
  UserLoginDm({
    super.name,
    super.email,
    this.role,
  });

  UserLoginDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
