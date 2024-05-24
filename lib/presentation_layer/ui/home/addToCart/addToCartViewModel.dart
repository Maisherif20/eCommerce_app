import 'package:ecommerce/domain_layer/Use%20case/addToCartUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain_layer/Entities/cartEntity/CartResponseEntity.dart';

@injectable
class AddToCartViewModel extends Cubit<AddToCartState> {
  AddToCartUseCase addToCartUseCase;

  @factoryMethod
  AddToCartViewModel({required this.addToCartUseCase})
      : super(AddToCartInitialState());
   addToCart({required String productId}) async {
    emit(AddToCartLoadingState());
    var result = await addToCartUseCase.invoke(productId);
    try{
      result.fold((cartResponseEntity) {
        emit(AddToCartSuccessState(cartResponseEntity: cartResponseEntity));
      }, (error) {
        emit(AddToCartErrorState(errorMessage: error));
      });
    }catch(e)
     {
       emit(AddToCartErrorState(errorMessage: e.toString()));
     }

  }
// deleteProductFromCartUserCase(String productId) async {
//   emit(CartLoadingState());
//   try {
//     var addressData = await deleteProductFromCartUseCase.invoke(productId);
//     addressData.fold((response) {
//       emit(CartSuccessState(: response));
//     }, (error) {
//       emit(CartErrorState(errorMessage: error));
//     });
//   } catch (e) {
//     emit(CartErrorState(errorMessage: e.toString()));
//   }
// }
}

sealed class AddToCartState {}
class AddToCartInitialState extends AddToCartState {}

class AddToCartLoadingState extends AddToCartState {}

class AddToCartSuccessState extends AddToCartState {
  CartResponseEntity cartResponseEntity;
  AddToCartSuccessState({required this.cartResponseEntity});
}

class AddToCartErrorState extends AddToCartState {
  String errorMessage;
  AddToCartErrorState({required this.errorMessage});
}
