import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/AddressEntity.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/Data.dart';
import 'package:ecommerce/domain_layer/authEntites/AuthEntity.dart';

abstract class AddressReposatory{
  Future<Either<AddressEntity, String>>addAddress({required String name,
    required String homeDetails,
    required String phone,
    required String city});

  Future<Either<AddressEntity,String>>getAddress();
  // Future<Either<List<Data>,String>>getAddress();
}