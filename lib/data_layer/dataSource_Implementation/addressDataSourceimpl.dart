import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/api_manager/apiManager.dart';
import 'package:ecommerce/data_layer/dataSource_contract/addressDataSource.dart';
import 'package:ecommerce/data_layer/model/addressResponse/AddressResponse.dart';
import 'package:ecommerce/data_layer/model/addressResponse/DataDto.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/AddressEntity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AddressDataSource)
class AddressDataSourceImpl extends AddressDataSource {
  ApiManager apiManager;
  @factoryMethod
  AddressDataSourceImpl({required this.apiManager});
  @override
  Future<Either<AddressResponse, String>> addAddress(
      {required String name,
      required String homeDetails,
      required String phone,
      required String city}) async{
    try {
      var response = await apiManager.addAddress(name: name, homeDetails: homeDetails, phone: phone, city: city);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<AddressResponse, String>> getAddress() async{
    try {
      var response = await apiManager.getUserAddress();
      if (response.statusMsg != null) {
        return Right(response.message!  ?? "Error in data source impl");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }
  // Future<Either<List<DataDTO>, String>> getAddress() async{
  //   try {
  //     var response = await apiManager.getUserAddress();
  //     if (response.status != null) {
  //       return Right(response.message ?? "");
  //     } else {
  //       return Left(response.dataDto!);
  //     }
  //   } catch (e) {
  //     return Right(e.toString()); // error from server
  //   }
  // }
}
