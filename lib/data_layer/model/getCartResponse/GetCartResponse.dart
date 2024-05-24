import 'package:ecommerce/data_layer/model/getCartResponse/Data.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/GetCartResponseEntity.dart';
class GetCartResponse {
  GetCartResponse({
      this.status,
      this.statusMsg,
      this.message,
      this.numOfCartItems,
      this.data,});

  GetCartResponse.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? statusMsg;
  String? message;
  num? numOfCartItems;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
  GetCartResponseEntity toGetCartResponseEntity(){
    return GetCartResponseEntity(
      status: status ,
      numOfCartItems: numOfCartItems,
      dataEnitiy: data?.toDataEnitiy(),
      message: message,
      statusMsg: statusMsg,
    );
  }

}