import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Entities/WishListEntity.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'package:ecommerce/domain_layer/Reposatory/productRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishLstUseCase {
  ProductRepository productRepository;
  @factoryMethod
  AddToWishLstUseCase({required this.productRepository});
  Future<Either<WishListEntity, String>> invoke({required String productId}) {
    return productRepository.addToWishList(productId);
  }
}
