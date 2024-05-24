import 'package:ecommerce/data_layer/model/BrandsResponse/brandDto.dart';
import 'package:ecommerce/data_layer/model/categoriesResponse/CategoryDto.dart';
import 'package:ecommerce/data_layer/model/productResponse/SubcategoryDto.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/ProductEntity.dart';
class Product {
  Product({
      this.subcategoryDto,
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.categoryDto,
      this.brandDto,
      this.ratingsAverage,});

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategoryDto = [];
      json['subcategory'].forEach((v) {
        subcategoryDto?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    categoryDto = json['category'] != null ? CategoryDto.fromJson(json['category']) : null;
    brandDto = json['brand'] != null ? BrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
  }
  List<SubcategoryDto>? subcategoryDto;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryDto? categoryDto;
  BrandDto? brandDto;
  num? ratingsAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategoryDto != null) {
      map['subcategory'] = subcategoryDto?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['title'] = title;
    map['quantity'] = quantity;
    map['imageCover'] = imageCover;
    if (categoryDto != null) {
      map['category'] = categoryDto?.toJson();
    }
    if (brandDto != null) {
      map['brand'] = brandDto?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['id'] = id;
    return map;
  }
  ProductEntity toProductEntity(){
    return ProductEntity(
      id: id,
      subcategory: subcategoryDto?.map((e) => e.toSubCategory()).toList(),
      title: title,
      quantity: quantity,
      imageCover: imageCover,
      ratingsAverage: ratingsAverage,
      brand: brandDto?.toBrand(),
      category: categoryDto?.toCategory(),
    );
  }

}