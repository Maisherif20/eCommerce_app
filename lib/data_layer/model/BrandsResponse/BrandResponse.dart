import '../paginationDto.dart';
import 'brandDto.dart';

class BrandResponse {
  BrandResponse({
      this.results, 
      this.paginationDto,
      this.data,});

  BrandResponse.fromJson(dynamic json) {
    results = json['results'];
    paginationDto = json['metadata'] != null ? PaginationDto.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandDto.fromJson(v));
      });
    }
  }
  num? results;
  PaginationDto? paginationDto;
  List<BrandDto>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (paginationDto != null) {
      map['metadata'] = paginationDto?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}