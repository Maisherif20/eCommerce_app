import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Reposatory/authReposatory.dart';
import 'package:injectable/injectable.dart';
import '../authEntites/AuthEntity.dart';

@injectable
class AuthUpdateUserDataUseCase {
  AuthReposatory authReposatory;
  @factoryMethod
  AuthUpdateUserDataUseCase({required this.authReposatory});
  Future<Either<AuthEntity, String>> invoke(
      {required String name , required String mobileNum}) {
    return authReposatory.updateUserNameAndPhone( name: name, mobileNum: mobileNum);
  }
}
