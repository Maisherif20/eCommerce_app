import 'package:ecommerce/domain_layer/authEntites/AuthEntity.dart';

import 'UserDTO.dart';

class AuthResponse {
  AuthResponse({
      this.message, 
      this.statusMsg, 
      this.user, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDTO.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  UserDTO? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthEntity toAuthEntity(){
    return AuthEntity(
      user: user?.toUserEntity(),
      token: token,
      message: message,
      statusMsg: statusMsg,
    );
  }

}