import 'package:ecommerce/data_layer/dataSource_contract/brandDataSource.dart';
import 'package:ecommerce/domain_layer/Entities/Brand.dart';
import 'package:ecommerce/domain_layer/Reposatory/brandRepsositry.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:BrandsRepository)
class BrandsRepositoryImpl extends BrandsRepository{
  BrandDataSource brandDataSource;
  @factoryMethod
  BrandsRepositoryImpl({required this.brandDataSource});
  @override
  Future<List<Brand>?> getBrands() {

    return brandDataSource.getBrands();

  }

}