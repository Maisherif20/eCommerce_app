import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/dataSource_contract/cartDataSource.dart';
import 'package:ecommerce/domain_layer/Entities/cartEntity/CartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/GetCartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Reposatory/cartReposatory.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartReposatory)
class CartReposatoryImpl extends CartReposatory {
  @factoryMethod
  CartDataSource cartDataSource;
  CartReposatoryImpl({required this.cartDataSource});
  @override
  Future<Either<CartResponseEntity, String>> addToCart(String productId) async {
    var result = await cartDataSource.addToCart(productId: productId);
    return result.fold((response) {
      return left(response.toCartResponseEntity());
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<GetCartResponseEntity, String>> getCart() async{
    var result = await cartDataSource.getCart();
    return result.fold((response) {
      return left(response.toGetCartResponseEntity());
    }, (error) {
      return right(error);
    });
  }
}
