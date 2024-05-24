import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Reposatory/authReposatory.dart';
import 'package:injectable/injectable.dart';
import '../authEntites/AuthEntity.dart';

@injectable
class AuthSignInUseCase {
  AuthReposatory authReposatory;
  @factoryMethod
  AuthSignInUseCase({required this.authReposatory});
  Future<Either<AuthEntity, String>> invoke(
      {required String email, required String password}) {
    return authReposatory.signIn(email: email, password: password);
  }
}
