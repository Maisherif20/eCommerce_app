import 'package:ecommerce/domain_layer/Entities/Brand.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'package:ecommerce/domain_layer/Use%20case/addToCartUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/getBrandsUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/getCategoriesUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/getProductUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  GetProductUseCase getProductUseCase;

  @factoryMethod
  HomeTabViewModel({
    required this.getCategoriesUseCase,
    required this.getBrandsUseCase,
    required this.getProductUseCase,
  }) : super(LoadingState(message: "Loading..."));
  void initPage() async {
    emit(LoadingState(message: "Loading..."));
    try {
      var categories = await getCategoriesUseCase.invoke();
      var brands = await getBrandsUseCase.invoke();
      var products = await getProductUseCase.invoke();
      emit(SuccessState(
          categories: categories, brands: brands, products: products));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class HomeTabState {}

class LoadingState extends HomeTabState {
  String message;
  LoadingState({required this.message});
}

class SuccessState extends HomeTabState {
  List<Category>? categories;
  List<Brand>? brands;
  ProductEntity? products;
  SuccessState(
      {required this.categories, required this.brands, required this.products});
}

class ErrorState extends HomeTabState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
