

import 'package:ecommerce/data_layer/model/getCartResponse/Product.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/Products.dart';

class Products {
  Products({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }
  num? count;
  String? id;
  Product? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }
  ProductsEntity toProductsEntity(){
    return ProductsEntity(
      id: id,
      count: count,
      price: price,
      productEntity: product?.toProductEntity(),
    );
  }

}