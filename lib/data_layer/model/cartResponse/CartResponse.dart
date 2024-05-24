import 'package:ecommerce/domain_layer/Entities/cartEntity/CartEntity.dart';
import 'package:ecommerce/domain_layer/Entities/cartEntity/CartResponseEntity.dart';

import 'cartModel.dart';

class CartResponse {
  CartResponse({
      this.status, 
      this.statusMsg,
      this.message,
      this.numOfCartItems, 
      this.data,});

  CartResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartModel.fromJson(json['data']) : null;
  }
  String? status;
  String? statusMsg;
  String? message;
  num? numOfCartItems;
  CartModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
  CartResponseEntity toCartResponseEntity(){
    return CartResponseEntity(
      message: message,
      data: data?.toCartEntity(),
      numOfCartItems: numOfCartItems,
    );
  }
}