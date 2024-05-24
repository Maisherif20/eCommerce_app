import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/AddressEntity.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/Data.dart';
import 'package:ecommerce/domain_layer/Reposatory/addressReposatory.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddressUseCase {
  AddressReposatory addressReposatory;
  @factoryMethod
  GetAddressUseCase({required this.addressReposatory});
  Future<Either<AddressEntity, String>> invoke() {
    return addressReposatory.getAddress();
  }
}
