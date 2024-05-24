import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/api_manager/apiManager.dart';
import 'package:ecommerce/data_layer/dataSource_contract/authDataSource.dart';
import 'package:ecommerce/data_layer/model/auth_Response/AuthResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource {
  ApiManager apiManager;
  @factoryMethod
  AuthDataSourceImpl({required this.apiManager});
  @override
  Future<Either<AuthResponse, String>> signUp(
      {required String email,
      required String password,
      required String mobileNum,
      required String name}) async {
    try {
      var response = await apiManager.signUp(
          email: email, password: password, mobileNum: mobileNum, name: name);
      if (response.statusMsg != null) {
        return Right(response.message ?? "");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<AuthResponse, String>> signIn(
      {required String email, required String password}) async {
    try {
      var response = await apiManager.signIn(email: email, password: password);
      if (response.statusMsg != null) {
        return Right(response.message! ?? "");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<AuthResponse, String>> updateUserNameAndPhone(
      {required String name, required String mobileNum}) async {
    try {
      var response = await apiManager.updateUserNameAndPhone(
          name: name, mobileNum: mobileNum);
      if (response.statusMsg != null) {
        return Right(response.message! ?? "");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<AuthResponse, String>> updateUserEmail(
      {required String email}) async {
    try {
      var response = await apiManager.updateUserEmail(email: email);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<AuthResponse, String>> updatePassword(
      {required String current,
      required String password,
      required String rePassword}) async{
    try {
      var response = await apiManager.updateUserPassword(current: current, password: password, rePassword: rePassword);
      if (response.statusMsg != null) {
        return Right(response.message! ?? "");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
