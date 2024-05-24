import 'package:ecommerce/data_layer/api_manager/apiManager.dart';
import 'package:ecommerce/data_layer/dataSource_contract/brandDataSource.dart';
import 'package:ecommerce/domain_layer/Entities/Brand.dart';
import 'package:injectable/injectable.dart';
@Injectable(as : BrandDataSource)
class BrandsDataSourceImpl extends BrandDataSource{
  ApiManager apiManager;
  @factoryMethod
  BrandsDataSourceImpl({required this.apiManager});
  @override
  Future<List<Brand>?> getBrands() async{
    var response = await apiManager.getBrands();
    return response.data?.map((brandDto) => brandDto.toBrand()).toList();
  }

}