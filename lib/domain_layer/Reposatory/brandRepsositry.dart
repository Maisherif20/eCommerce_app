import 'package:ecommerce/domain_layer/Entities/Brand.dart';

abstract class BrandsRepository{
  Future<List<Brand>?>getBrands();
}