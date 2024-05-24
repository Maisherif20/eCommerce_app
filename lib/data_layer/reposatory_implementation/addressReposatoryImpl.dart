import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/dataSource_contract/addressDataSource.dart';
import 'package:ecommerce/data_layer/model/addressResponse/AddressResponse.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/AddressEntity.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/Data.dart';
import 'package:ecommerce/domain_layer/Reposatory/addressReposatory.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AddressReposatory )
class AddressReposatoryImpl extends AddressReposatory {
  AddressDataSource addressDataSource;
  @factoryMethod
  AddressReposatoryImpl({required this.addressDataSource});
  @override
  Future<Either<AddressEntity, String>> addAddress(
      {required String name,
      required String homeDetails,
      required String phone,
      required String city}) async{
    var result = await addressDataSource.addAddress(name: name, homeDetails: homeDetails, phone: phone, city: city);
    return result.fold((response) {
      return Left(response.toAddressEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<AddressEntity, String>> getAddress() async{
    var result = await addressDataSource.getAddress();
    return result.fold((response) {
      return Left(response.toAddressEntity());
    }, (error) {
      return Right(error);
    });
  }
  // Future<Either<List<Data>, String>> getAddress() async{
  //   var result = await addressDataSource.getAddress();
  //   return result.fold((response) {
  //     return Left(response.map((data) => data.toData()).toList());
  //   }, (error) {
  //     return Right(error);
  //   });
  // }
}
