


import '../../../domain_layer/Entities/productResponse/Product.dart';
import '../BrandsResponse/brandDto.dart';
import '../categoriesResponse/CategoryDto.dart';
import 'SubcategoryDto.dart';

class ProductDto {
  ProductDto({
      this.sold, 
      this.images, 
      this.subcategoryDto,
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.priceAfterDiscount, 
      this.imageCover, 
      this.categoryDto,
      this.brandDto,
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt,});

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategoryDto = [];
      json['subcategory'].forEach((v) {
        subcategoryDto?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    imageCover = json['imageCover'];
    categoryDto = json['category'] != null ? CategoryDto.fromJson(json['category']) : null;
    brandDto = json['brand'] != null ? BrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? sold;
  List<String>? images;
  List<SubcategoryDto>? subcategoryDto;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  CategoryDto? categoryDto;
  BrandDto? brandDto;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    if (subcategoryDto != null) {
      map['subcategory'] = subcategoryDto?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['imageCover'] = imageCover;
    if (categoryDto != null) {
      map['category'] = categoryDto?.toJson();
    }
    if (brandDto != null) {
      map['brand'] = brandDto?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    return map;
  }
  Product toProduct(){
    return Product(
      id: id,
      slug: slug,
      category: categoryDto?.toCategory(),
      subcategory: subcategoryDto?.map((e) => e.toSubCategory()).toList(),
      title: title,
      brand: brandDto?.toBrand(),
      sold: sold,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      quantity: quantity,
      price: price,
      images: images,
      imageCover: imageCover,
      description: description,
      createdAt: createdAt,
      priceAfterDiscount: priceAfterDiscount,
      updatedAt: updatedAt

      );
}

}