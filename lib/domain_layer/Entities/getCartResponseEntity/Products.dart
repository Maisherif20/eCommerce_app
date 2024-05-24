import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/ProductEntity.dart';

class ProductsEntity {
  ProductsEntity({
      this.count, 
      this.id, 
      this.productEntity,
      this.price,});

  ProductsEntity.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    productEntity = json['product'] != null ? ProductEntity.fromJson(json['product']) : null;
    price = json['price'];
  }
  num? count;
  String? id;
  ProductEntity? productEntity;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (productEntity != null) {
      map['product'] = productEntity?.toJson();
    }
    map['price'] = price;
    return map;
  }

}