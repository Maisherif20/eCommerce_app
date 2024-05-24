import 'package:dartz/dartz.dart';

import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'package:ecommerce/domain_layer/Reposatory/productRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class DeleteProductUseCase{
  ProductRepository productRepository;
  @factoryMethod
  DeleteProductUseCase({required this.productRepository});
  Future<Either<ProductEntity , String>>invoke(String productId){
    return productRepository.deleteProductFromWishList(productId);
  }
}