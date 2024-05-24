import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/api_manager/apiManager.dart';
import 'package:ecommerce/data_layer/dataSource_contract/productDataSource.dart';
import 'package:ecommerce/data_layer/model/addTowishList/WishListResponse.dart';
import 'package:ecommerce/data_layer/model/productResponse/ProductResponse.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/Product.dart';
import 'package:ecommerce/domain_layer/Reposatory/productRepository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:ProductDataSource)
class ProductDataSourceImpl extends ProductDataSource{
  ApiManager apiManager;
  @factoryMethod
  ProductDataSourceImpl({required this.apiManager});
  @override
  Future<ProductResponse> getProduct({ProductSort? sortBy , String? categoryId}) async{
    var response = await apiManager.getProducts(sortBy ,  categoryId);
    return response;
        //response.data?.map((productDto) => productDto.toProduct()).toList();
  }

  @override
  Future<Either<WishListResponse, String>> addToWishList(String productId) async{
    try {
      var response = await apiManager.addToWishList(productId: productId);
      if (response.statusMsg != null) {
        return Right(response.message!  ?? "Error in data source impl");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<ProductResponse, String>> getUserWishList() async{
    try {
      var response = await apiManager.getUserWishList();
      if (response.statusMsg != null) {
        return Right(response.message!  ?? "Error in data source impl");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<ProductResponse, String>> deleteProductFromWishList(String productId) async{
    try {
      var response = await apiManager.deleteProductFromWishList(productId);
      if (response.statusMsg != null) {
        return Right(response.message!  ?? "Error in data source impl");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

}