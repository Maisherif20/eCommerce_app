import 'package:ecommerce/data_layer/model/auth_Response/AuthResponse.dart';
import 'package:dartz/dartz.dart';

abstract class AuthDataSource {
  Future<Either<AuthResponse, String>> signUp(
      {required String email,
      required String password,
      required String mobileNum,
      required String name});
  Future<Either<AuthResponse, String>> signIn(
      {required String email, required String password});

  Future<Either<AuthResponse, String>> updateUserNameAndPhone(
      {required String name , required String mobileNum});

  Future<Either<AuthResponse, String>> updateUserEmail(
      {required String email});
  Future<Either<AuthResponse, String>> updatePassword({
      required String current , required String password ,required String rePassword });
}
