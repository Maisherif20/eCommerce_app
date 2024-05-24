import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/dataSource_contract/authDataSource.dart';
import 'package:ecommerce/domain_layer/Reposatory/authReposatory.dart';
import 'package:ecommerce/domain_layer/authEntites/AuthEntity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthReposatory)
class AuthReposatoryImpl extends AuthReposatory {
  AuthDataSource authDataSource;
  @factoryMethod
  AuthReposatoryImpl({required this.authDataSource});
  @override
  Future<Either<AuthEntity, String>> signUp(
      {required String email,
      required String password,
      required String mobileNum,
      required String name}) async {
    var result = await authDataSource.signUp(
        email: email, password: password, mobileNum: mobileNum, name: name);
    return result.fold((response) {
      return Left(response.toAuthEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<AuthEntity, String>> signIn(
      {required String email, required String password}) async {
    var result = await authDataSource.signIn(email: email, password: password);
    return result.fold((response) {
      return Left(response.toAuthEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<AuthEntity, String>> updateUserNameAndPhone(
      {required String name, required String mobileNum}) async {
    var result = await authDataSource.updateUserNameAndPhone(
        name: name, mobileNum: mobileNum);
    return result.fold((response) {
      return Left(response.toAuthEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<AuthEntity, String>> updateUserEmail(
      {required String email}) async {
    var result = await authDataSource.updateUserEmail(email: email);
    return result.fold((response) {
      return Left(response.toAuthEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<AuthEntity, String>> updateUserPassword(
      {required String current,
      required String password,
      required String rePassword}) async{
    var result = await authDataSource.updatePassword(current: current, password: password, rePassword: rePassword);
    return result.fold((response) {
      return Left(response.toAuthEntity());
    }, (error) {
      return Right(error);
    });
  }
}
