
import 'package:ecommerce/data_layer/model/getCartResponse/Products.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/DataEnitiy.dart';

class Data {
  Data({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }
  DataEnitiy toDataEnitiy(){
    return DataEnitiy(
      id: id,
      cartOwner: cartOwner,
      createdAt: createdAt,
      updatedAt: updatedAt,
      totalCartPrice: totalCartPrice,
      productsEntity: products?.map((e) => e.toProductsEntity()).toList(),
    );
  }

}