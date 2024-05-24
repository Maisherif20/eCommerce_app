import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/authEntites/AuthEntity.dart';

abstract class AuthReposatory {
  Future<Either<AuthEntity, String>> signUp(
      {required String email,
      required String password,
      required String mobileNum,
      required String name});
  Future<Either<AuthEntity, String>> signIn(
      {required String email, required String password});
  Future<Either<AuthEntity, String>> updateUserNameAndPhone(
      {required String name, required String mobileNum});
  Future<Either<AuthEntity, String>> updateUserEmail({required String email});
  Future<Either<AuthEntity, String>> updateUserPassword(
      {required String current,
      required String password,
      required String rePassword});
}
