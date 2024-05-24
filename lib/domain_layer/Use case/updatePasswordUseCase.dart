import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../Reposatory/authReposatory.dart';
import '../authEntites/AuthEntity.dart';
@injectable
class UpdatePasswordUseCase {
  AuthReposatory authReposatory;
  @factoryMethod
  UpdatePasswordUseCase({required this.authReposatory});
  Future<Either<AuthEntity, String>> invoke(
      {required String current, required String password , required String rePassword}) {
    return authReposatory.updateUserPassword(current: current, password: password, rePassword: rePassword);
  }
}