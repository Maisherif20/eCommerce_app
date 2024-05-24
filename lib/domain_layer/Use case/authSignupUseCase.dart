import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Reposatory/authReposatory.dart';
import 'package:ecommerce/domain_layer/authEntites/AuthEntity.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthSignUpUseCase {
  AuthReposatory authReposatory;
  @factoryMethod
  AuthSignUpUseCase({required this.authReposatory});
  Future<Either<AuthEntity, String>> invoke(
      {required String email,
      required String password,
      required String mobileNum,
      required String name}) {
    return authReposatory.signUp(
        email: email, password: password, mobileNum: mobileNum, name: name);
  }
}
