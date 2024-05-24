import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/model/addressResponse/AddressResponse.dart';
import 'package:ecommerce/data_layer/model/addressResponse/DataDto.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/AddressEntity.dart';
abstract class AddressDataSource{
  Future<Either<AddressResponse, String>> addAddress(
      {required String name,
        required String homeDetails,
        required String phone,
        required String city});
  Future<Either<AddressResponse,String>>getAddress();
  // Future<Either<List<DataDTO>,String>>getAddress();
}