import 'package:ecommerce/data_layer/model/addressResponse/DataDto.dart';
import '../../../domain_layer/Entities/addressEntity/AddressEntity.dart';
class AddressResponse {
  AddressResponse({
      this.status, 
      this.message, 
      this.dataDto,});

  AddressResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    if (json['data'] != null) {
      dataDto = [];
      json['data'].forEach((v) {
        dataDto?.add(DataDTO.fromJson(v));
      });
    }
  }
  String? status;
  String? statusMsg;
  String? message;
  List<DataDTO>? dataDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    if (dataDto != null) {
      map['data'] = dataDto?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  AddressEntity toAddressEntity(){
    return AddressEntity(
      data: dataDto?.map((e) => e.toData()).toList(),
      message: message,
      status: status,
    );
  }
}