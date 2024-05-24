import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/DataEnitiy.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
    this.status,
    this.statusMsg,
    this.message,
    this.numOfCartItems,
    this.dataEnitiy,
  });

  GetCartResponseEntity.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    dataEnitiy =
        json['data'] != null ? DataEnitiy.fromJson(json['data']) : null;
  }
  String? status;
  String? statusMsg;
  String? message;
  num? numOfCartItems;
  DataEnitiy? dataEnitiy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['numOfCartItems'] = numOfCartItems;
    if (dataEnitiy != null) {
      map['data'] = dataEnitiy?.toJson();
    }
    return map;
  }
}
