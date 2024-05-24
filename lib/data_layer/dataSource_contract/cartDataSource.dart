import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/model/cartResponse/CartResponse.dart';
import 'package:ecommerce/data_layer/model/getCartResponse/GetCartResponse.dart';

abstract class CartDataSource{
  Future <Either<CartResponse , String>>addToCart({required String productId});
  Future <Either<GetCartResponse , String>>getCart();
  // Future <Either<CartResponse , String>>getCart();
}