class WishListEntity {
  WishListEntity({
      this.status, 
      this.statusMsg,
      this.message,
      this.data,});

  WishListEntity.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? status;
  String? statusMsg;
  String? message;
  List<String>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}