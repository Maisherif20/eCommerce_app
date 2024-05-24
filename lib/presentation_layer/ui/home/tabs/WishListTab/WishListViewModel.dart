import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'package:ecommerce/domain_layer/Use%20case/addToWishListUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/getUserWishList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain_layer/Use case/deleteProductUseCase.dart';

@injectable
class WishListViewModel extends Cubit<WishListStates> {
  @factoryMethod
  WishListViewModel(
      { required this.getUserWishListUseCase , required this.deleteProductUseCase})
      : super(WishListInitialState());
  GetUserWishListUseCase getUserWishListUseCase;
  DeleteProductUseCase deleteProductUseCase;
  @override
  // addToWishList(String productId) async {
  //   emit(AddToWishListLoadingState());
  //   try {
  //     var addressData = await addToWishLstUseCase.invoke(productId: productId);
  //     addressData.fold((response) {
  //       emit(AddToWishListSuccessState(wishListEntity: response));
  //     }, (error) {
  //       emit(AddToWishListErrorState(errorMessage: error));
  //     });
  //   } catch (e) {
  //     emit(AddToWishListErrorState(errorMessage: e.toString()));
  //   }
  // }

getUserWishList() async {
  emit(WishListLoadingState());
  try {
    var addressData = await getUserWishListUseCase.invoke();
    addressData.fold((response) {
      emit(WishListSuccessState(productEntity: response));
    }, (error) {
      emit(WishListErrorState(errorMessage: error));
    });
  } catch (e) {
    emit(WishListErrorState(errorMessage: e.toString()));
  }
}
deleteProductUserCase(String productId) async {
  emit(WishListLoadingState());
  try {
    var addressData = await deleteProductUseCase.invoke(productId);
    addressData.fold((response) {
      emit(WishListSuccessState(productEntity: response));
    }, (error) {
      emit(WishListErrorState(errorMessage: error));
    });
  } catch (e) {
    emit(WishListErrorState(errorMessage: e.toString()));
  }
}
}

class WishListStates {}

class WishListInitialState extends WishListStates {}

class WishListLoadingState extends WishListStates {}

class WishListSuccessState extends WishListStates {
  ProductEntity productEntity;
  WishListSuccessState({required this.productEntity});
}

class WishListErrorState extends WishListStates {
  String errorMessage;
  WishListErrorState({required this.errorMessage});
}
