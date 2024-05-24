import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/AddressEntity.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/Data.dart';
import 'package:ecommerce/domain_layer/Reposatory/addressReposatory.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressUseCase {
  AddressReposatory addressReposatory;
  @factoryMethod
  AddressUseCase({required this.addressReposatory});
  Future<Either<AddressEntity, String>> invoke(
      {required String name,
      required String homeDetails,
      required String phone,
      required String city}) {
    return  addressReposatory.addAddress(
        name: name, homeDetails: homeDetails, phone: phone, city: city);
  }
}
