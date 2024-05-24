import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/Product.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'package:ecommerce/domain_layer/Reposatory/productRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProductUseCase{
  ProductRepository productRepository;
  @factoryMethod
  GetProductUseCase({required this.productRepository});
  Future<ProductEntity>invoke([Category? category]){
    return productRepository.getProducts(categoryId: category?.id??"");
  }
}