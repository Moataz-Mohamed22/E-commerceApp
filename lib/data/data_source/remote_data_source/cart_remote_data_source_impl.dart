import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/cach/shared_preferences.dart';
import 'package:ecommerce_app/data/model/Get_cart_response_Dm.dart';
import 'package:ecommerce_app/domain/repositories/data_source/remote_data_source/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/endpoints.dart';
import '../../../core/failures/failures.dart';
import '../../../domain/entities/Get_cart_response_entity.dart';
import '../../model/ProductResponseDm.dart';
@Injectable(as: CartRemoteDataSource)
 class CartRemoteDataSourceImpl implements CartRemoteDataSource{
   ApiManager apiManager ;
   CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getItemInCart() async{
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var token =SharedPreferencesUtils.getData(key: "token");
        var response =
            await apiManager.getData(endPoint: EndPoints.addToCart ,
            headers: {
              "token":token
            });
        var getCartRespons = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartRespons);
        } else {
          return Left(ServerError(errorMessage: getCartRespons.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId) async{
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var token =SharedPreferencesUtils.getData(key: "token");
        var response =
            await apiManager.deleteData(endPoint:"${EndPoints.addToCart}/$productId" ,
            headers: {
              "token":token
            });
        var deleteCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteCartResponse);
        } else {
          return Left(ServerError(errorMessage: deleteCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }  }

