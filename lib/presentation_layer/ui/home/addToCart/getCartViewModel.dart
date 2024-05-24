import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/GetCartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Use%20case/getCartUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  @factoryMethod
  CartViewModel({required this.getCartUseCase}) : super(CartInitialState());
  GetCartUseCase getCartUseCase;
  getCart() async {
    emit(CartLoadingState());
    try {
      var addressData = await getCartUseCase.invoke();
      addressData.fold((response) {
        emit(CartSuccessState(getCartResponseEntity: response));
      }, (error) {
        emit(CartErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(CartErrorState(errorMessage: e.toString()));
    }
  }
  // deleteProductUserCase(String productId) async {
  //   emit(WishListLoadingState());
  //   try {
  //     var addressData = await deleteProductUseCase.invoke(productId);
  //     addressData.fold((response) {
  //       emit(WishListSuccessState(productEntity: response));
  //     }, (error) {
  //       emit(WishListErrorState(errorMessage: error));
  //     });
  //   } catch (e) {
  //     emit(WishListErrorState(errorMessage: e.toString()));
  //   }
  // }
}

class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  CartSuccessState({required this.getCartResponseEntity});
}

class CartErrorState extends CartStates {
  String errorMessage;
  CartErrorState({required this.errorMessage});
}
