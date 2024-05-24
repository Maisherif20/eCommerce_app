import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/Products.dart';
class DataEnitiy {
  DataEnitiy({
      this.id, 
      this.cartOwner, 
      this.productsEntity,
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  DataEnitiy.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      productsEntity = [];
      json['products'].forEach((v) {
        productsEntity?.add(ProductsEntity.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<ProductsEntity>? productsEntity;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (productsEntity != null) {
      map['products'] = productsEntity?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

}