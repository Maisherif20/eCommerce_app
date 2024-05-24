import 'package:ecommerce/domain_layer/Entities/Brand.dart';

abstract class BrandDataSource{
  Future<List<Brand>?>getBrands();
}