import 'CartEntity.dart';

class CartResponseEntity {
  CartResponseEntity({
      this.message, 
      this.numOfCartItems, 
      this.data,});

  CartResponseEntity.fromJson(dynamic json) {
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartEntity.fromJson(json['data']) : null;
  }
  String? message;
  num? numOfCartItems;
  CartEntity? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}