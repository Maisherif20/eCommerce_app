import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/Entities/cartEntity/CartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/GetCartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Reposatory/cartReposatory.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase {
  CartReposatory cartReposatory;
  GetCartUseCase({required this.cartReposatory});
  Future<Either<GetCartResponseEntity, String>> invoke() {
    return cartReposatory.getCart();
  }
}
