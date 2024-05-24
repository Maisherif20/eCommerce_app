import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Entities/WishListEntity.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/Product.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';

abstract class ProductRepository{
  Future<ProductEntity> getProducts({ProductSort? sortBy , String? categoryId});
  Future<Either<WishListEntity, String>> addToWishList(String productId);
  Future<Either<ProductEntity, String>> getUserWishList();
  Future<Either<ProductEntity, String>> deleteProductFromWishList(String productId);
}
enum ProductSort{
  mostSelling("-sold"),
  highestPrice("-price");
  final String value;
  const ProductSort(this.value);
}