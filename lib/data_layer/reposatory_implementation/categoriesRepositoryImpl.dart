import 'package:ecommerce/data_layer/dataSource_contract/categoriesDataSource.dart';
import 'package:ecommerce/data_layer/reposatory_implementation/categoriesRepositoryImpl.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/domain_layer/Reposatory/categories_reposoitory.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategpriesDataSource categpriesDataSource;
  @factoryMethod
  CategoriesRepositoryImpl({required this.categpriesDataSource});
  @override
  Future<List<Category>?> getCatogries() {
    return categpriesDataSource.getCategories();
  }
}
