import 'package:ecommerce/domain_layer/Entities/Brand.dart';
import 'package:ecommerce/domain_layer/Reposatory/brandRepsositry.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetBrandsUseCase{
  BrandsRepository brandsRepository;
  @factoryMethod
  GetBrandsUseCase({required this.brandsRepository});
  Future<List<Brand>?> invoke(){
    return brandsRepository.getBrands();
  }
}