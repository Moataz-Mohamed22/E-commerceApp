class LoginResponseEntity {
  LoginResponseEntity({this.message, this.user, this.token, this.statusMsg});

  String? message;
  String? statusMsg;
  UserLoginEntity? user;
  String? token;
}

class UserLoginEntity {
  UserLoginEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
