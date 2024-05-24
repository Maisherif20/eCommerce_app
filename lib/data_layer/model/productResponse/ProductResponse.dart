import 'package:ecommerce/data_layer/model/paginationDto.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'ProductDto.dart';

class ProductResponse {
  ProductResponse({
    this.results,
    this.message,
    this.statusMsg,
    this.paginationDto,
    this.data,
  });

  ProductResponse.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    paginationDto = json['metadata'] != null
        ? PaginationDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }
  num? results;
  String? message;
  String? statusMsg;
  PaginationDto? paginationDto;
  List<ProductDto>? data;

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
  ProductEntity toProductEntity(){
    return ProductEntity(
      results: results,
      message: message,
      statusMsg: statusMsg,
      data: data?.map((e) => e.toProduct()).toList(),
    );
  }
}
