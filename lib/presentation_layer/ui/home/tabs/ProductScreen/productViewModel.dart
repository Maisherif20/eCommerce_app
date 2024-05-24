import 'package:ecommerce/domain_layer/Entities/Brand.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'package:ecommerce/domain_layer/Use%20case/getBrandsUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/getCategoriesUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/getProductUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain_layer/Entities/productResponse/Product.dart';

@injectable
class ProductViewModel extends Cubit<HomeTabState> {
  GetProductUseCase getProductUseCase;

  @factoryMethod
  ProductViewModel({required this.getProductUseCase})
      : super(LoadingState(message: "Loading..."));
  void initPage(Category category) async {
    emit(LoadingState(message: "Loading..."));
    try {
      var products = await getProductUseCase.invoke(category);
      emit(SuccessState(products: products));
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
  ProductEntity products;
  SuccessState({required this.products});
}

class ErrorState extends HomeTabState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
