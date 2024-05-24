import 'package:ecommerce/domain_layer/Entities/Category.dart';

abstract class CategpriesDataSource{
  Future<List<Category>?>getCategories();
}