import 'package:ecommerce/data_layer/model/paginationDto.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/Product.dart';


class ProductEntity {
  ProductEntity({
    this.results,
    this.message,
    this.statusMsg,
    this.paginationDto,
    this.data,
  });

  ProductEntity.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    paginationDto = json['metadata'] != null
        ? PaginationDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Product.fromJson(v));
      });
    }
  }
  num? results;
  String? message;
  String? statusMsg;
  PaginationDto? paginationDto;
  List<Product>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (paginationDto != null) {
      map['metadata'] = paginationDto?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
