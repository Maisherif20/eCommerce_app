import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../Reposatory/authReposatory.dart';
import '../authEntites/AuthEntity.dart';

@injectable
class AuthUpdateUserEmailUseCase {
  AuthReposatory authReposatory;
  @factoryMethod
  AuthUpdateUserEmailUseCase({required this.authReposatory});
  Future<Either<AuthEntity, String>> invoke(
      {required String email}) {
    return authReposatory.updateUserEmail(email: email);
  }
}