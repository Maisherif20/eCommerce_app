import 'package:ecommerce/domain_layer/Entities/cartEntity/CartItemEntity.dart';

class CartEntity {
  CartEntity({
      this.id,
      this.cartOwner,
      this.products,
      this.totalCartPrice,});

  CartEntity.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartItemEntity.fromJson(v));
      });
    }
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartItemEntity>? products;
  num? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }


}