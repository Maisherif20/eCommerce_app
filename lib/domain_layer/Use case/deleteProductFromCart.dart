import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Entities/cartEntity/CartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/GetCartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Reposatory/cartReposatory.dart';
import 'package:injectable/injectable.dart';
@injectable
class DeleteProductFromCartUseCase{
  CartReposatory cartReposatory;
  @factoryMethod
  DeleteProductFromCartUseCase({required this.cartReposatory});
  Future<Either<GetCartResponseEntity , String>>invoke(String productId){
    return cartReposatory.deleteProductFromCart(productId: productId);
  }
}