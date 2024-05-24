import 'package:ecommerce/domain_layer/Entities/cartEntity/CartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/GetCartResponseEntity.dart';
import 'package:ecommerce/domain_layer/Use%20case/deleteProductFromCart.dart';
import 'package:ecommerce/domain_layer/Use%20case/getCartUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteFromCartViewModel extends Cubit<DeleteFromCartStates> {
  @factoryMethod
  DeleteFromCartViewModel({required this.deleteProductFromCartUseCase}) : super(DeleteFromCartInitialState());
  DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  deleteFromCart({required String productId}) async {
    emit(DeleteFromCartLoadingState());
    try {
      var result = await deleteProductFromCartUseCase.invoke(productId);
      result.fold((response) {
        emit(DeleteFromCartSuccessState(getCartResponseEntity: response));
      }, (error) {
        emit(DeleteFromCartErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(DeleteFromCartErrorState(errorMessage: e.toString()));
    }
  }

}

class DeleteFromCartStates {}

class DeleteFromCartInitialState extends DeleteFromCartStates {}

class DeleteFromCartLoadingState extends DeleteFromCartStates {}

class DeleteFromCartSuccessState extends DeleteFromCartStates {
  GetCartResponseEntity getCartResponseEntity;
  DeleteFromCartSuccessState({required this.getCartResponseEntity});
}

class DeleteFromCartErrorState extends DeleteFromCartStates {
  String errorMessage;
  DeleteFromCartErrorState({required this.errorMessage});
}
