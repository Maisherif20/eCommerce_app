import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Entities/cartEntity/CartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Reposatory/cartReposatory.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  CartReposatory cartReposatory;
  AddToCartUseCase({required this.cartReposatory});
  Future<Either<CartResponseEntity, String>> invoke(String productId) {
    return cartReposatory.addToCart(productId);
  }
}
