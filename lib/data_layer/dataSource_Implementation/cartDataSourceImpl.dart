import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/api_manager/apiManager.dart';
import 'package:ecommerce/data_layer/dataSource_contract/cartDataSource.dart';
import 'package:ecommerce/data_layer/model/cartResponse/CartResponse.dart';
import 'package:ecommerce/data_layer/model/getCartResponse/GetCartResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CartDataSource)
class CartDataSourceImpl extends CartDataSource{
  @factoryMethod
  ApiManager apiManager;
  CartDataSourceImpl({required this.apiManager});
  @override
  Future<Either<CartResponse, String>> addToCart({required String productId}) async{
    try {
      var response = await apiManager.addToCart(productId: productId);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (error) {
      return Right(error.toString()); // error from server
    }
  }

  @override
  Future<Either<GetCartResponse, String>> getCart() async{
    try {
      var response = await apiManager.getCart();
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (error) {
      return Right(error.toString()); // error from server
    }
  }

  @override
  Future<Either<GetCartResponse, String>> deleteProductFromCart({required String productId}) async{
    try {
      var response = await apiManager.deleteFromCart(productId);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (error) {
      return Right(error.toString()); // error from server
    }
  }
}