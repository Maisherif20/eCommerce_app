import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/dataSource_contract/productDataSource.dart';
import 'package:ecommerce/domain_layer/Entities/WishListEntity.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/Product.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'package:ecommerce/domain_layer/Reposatory/productRepository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:ProductRepository)
class ProductRepositoryImpl extends ProductRepository{
  ProductDataSource productDataSource;
  @factoryMethod
  ProductRepositoryImpl({required this.productDataSource});
  @override
  Future<ProductEntity> getProducts({ProductSort? sortBy , String? categoryId}) async{
    var response = await productDataSource.getProduct(categoryId: categoryId??"");
    return response.toProductEntity();
  }

  @override
  Future<Either<WishListEntity, String>> addToWishList(String productId) async{
    var result = await productDataSource.addToWishList(productId);
    return result.fold((response) {
      return Left(response.toWishListEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<ProductEntity, String>> getUserWishList() async{
    var result = await productDataSource.getUserWishList();
    return result.fold((response) {
      return Left(response.toProductEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<ProductEntity, String>> deleteProductFromWishList(String productId) async{
    var result = await productDataSource.deleteProductFromWishList(productId);
    return result.fold((response) {
      return Left(response.toProductEntity());
    }, (error) {
      return Right(error);
    });
  }
}