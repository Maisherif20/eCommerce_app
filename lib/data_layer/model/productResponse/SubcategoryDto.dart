import 'package:ecommerce/domain_layer/Entities/Subcategory.dart';

class SubcategoryDto {
  SubcategoryDto({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  SubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
  Subcategory toSubCategory(){
    return Subcategory(
      id: id,
      slug: slug,
      name: name,
      category: category
    );
  }

}