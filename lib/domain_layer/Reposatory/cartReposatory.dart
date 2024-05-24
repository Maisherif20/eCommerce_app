import 'package:dartz/dartz.dart';

import 'package:ecommerce/domain_layer/Entities/cartEntity/CartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/GetCartResponseEntity.dart';

abstract class CartReposatory{
  Future<Either<CartResponseEntity , String>>addToCart(String productId);
  Future<Either<GetCartResponseEntity , String>>getCart();
}