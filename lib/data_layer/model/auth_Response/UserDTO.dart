import 'package:ecommerce/domain_layer/authEntites/UserEntity.dart';

class UserDTO {
  UserDTO({
      this.name, 
      this.email, 
      this.role,});

  UserDTO.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
  UserEntity toUserEntity(){
    return UserEntity(
      name: name,
      email: email,
      role: role,
    );
  }

}