import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/GetCartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Use%20case/deleteProductFromCart.dart';
import 'package:ecommerce/domain_layer/Use%20case/getCartUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  @factoryMethod
  CartViewModel({required this.getCartUseCase , required this.deleteProductFromCartUseCase}) : super(CartInitialState());
  GetCartUseCase getCartUseCase;
  DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  getCart() async {
    emit(CartLoadingState());
    try {
      var result = await getCartUseCase.invoke();
      result.fold((response) {
        emit(CartSuccessState(getCartResponseEntity: response));
      }, (error) {
        emit(CartErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(CartErrorState(errorMessage: e.toString()));
    }
  }

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
