import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/model/addTowishList/WishListResponse.dart';
import 'package:ecommerce/data_layer/model/productResponse/ProductResponse.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/Product.dart';
import 'package:ecommerce/domain_layer/Reposatory/productRepository.dart';

abstract class ProductDataSource{
  Future<ProductResponse>getProduct({ProductSort? sortBy , String? categoryId});
  Future<Either<WishListResponse, String>> addToWishList(String productId);
  Future<Either<ProductResponse, String>> getUserWishList();
  Future<Either<ProductResponse, String>> deleteProductFromWishList(String productId);
}