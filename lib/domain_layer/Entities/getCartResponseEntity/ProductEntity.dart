import 'package:ecommerce/domain_layer/Entities/Brand.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/domain_layer/Entities/Subcategory.dart';
class ProductEntity {
  ProductEntity({
      this.subcategory,
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category,
      this.brand,
      this.ratingsAverage,});

  ProductEntity.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
  }
  List<Subcategory>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['title'] = title;
    map['quantity'] = quantity;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['id'] = id;
    return map;
  }

}