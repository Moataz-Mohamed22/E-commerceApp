import 'package:ecommerce_app/domain/entities/add_cart_response_entity.dart';

class AddCartResponseDm extends AddCartResponseEntity {
  AddCartResponseDm({
      super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data, this.statusMsg});

  AddCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataCartDM.fromJson(json['data']) : null;
  }
String? statusMsg ;


}

class DataCartDM extends DataCartEntity{
  DataCartDM({
      super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  DataCartDM.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsDM.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }



}

class AddProductsDM extends AddProductEntity{
  AddProductsDM({
    super.count,
    super.id,
    super.product,
    super.price,});

  AddProductsDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}