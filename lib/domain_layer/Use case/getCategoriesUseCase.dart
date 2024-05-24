import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/domain_layer/Reposatory/categories_reposoitory.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  @factoryMethod
  GetCategoriesUseCase({required this.categoriesRepository});
  Future<List<Category>?> invoke() {
      return categoriesRepository.getCatogries();
  }
}
