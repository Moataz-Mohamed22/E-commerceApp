import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/data/model/RegisterResponseDm.dart';
import 'package:ecommerce_app/domain/repositories/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemotelyDataSource)
class AuthRemotelyDataSourceImpl implements AuthRemotelyDataSource {
  ApiManager apiManager;

  AuthRemotelyDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDm>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      final List<ConnectivityResult>connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(endPoint: EndPoints.register,
            body: {
              "name": name,
              "email": email,
              "password": password,
              "rePassword": rePassword,
              "phone": phone
            });
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}