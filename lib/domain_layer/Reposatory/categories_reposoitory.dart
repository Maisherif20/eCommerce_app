import 'package:ecommerce/domain_layer/Entities/Category.dart';

abstract class CategoriesRepository{
  Future<List<Category>?>getCatogries();
}