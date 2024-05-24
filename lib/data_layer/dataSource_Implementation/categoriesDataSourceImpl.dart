import 'package:ecommerce/data_layer/api_manager/apiManager.dart';
import 'package:ecommerce/data_layer/dataSource_contract/categoriesDataSource.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategpriesDataSource)
class CategoriesDataSourceImpl extends CategpriesDataSource {
  ApiManager apiManager;
  @factoryMethod
  CategoriesDataSourceImpl({required this.apiManager});
  @override
  Future<List<Category>?> getCategories() async {
    var response = await apiManager.getCatogries();
    // return response.data
    //     ?.map((categoryDto) => Category(
    //         id: categoryDto.id,
    //         image: categoryDto.image,
    //         name: categoryDto.name,
    //         slug: categoryDto.slug))
    //     .toList();
    return response.data
        ?.map((categoryDto) => categoryDto.toCategory())
        .toList();
  }
}
