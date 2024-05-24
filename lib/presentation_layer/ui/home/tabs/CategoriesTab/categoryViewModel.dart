import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/domain_layer/Use%20case/getCategoriesUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryTabViewModel extends Cubit<HomeTabState> {
  GetCategoriesUseCase getCategoriesUseCase;

  @factoryMethod
  CategoryTabViewModel({required this.getCategoriesUseCase})
      : super(LoadingState(message: "Loading..."));
  void initPage() async {
    emit(LoadingState(message: "Loading..."));
    try {
      var categories = await getCategoriesUseCase.invoke();
      ;
      emit(SuccessState(categories: categories));
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
  SuccessState({required this.categories});
}

class ErrorState extends HomeTabState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
