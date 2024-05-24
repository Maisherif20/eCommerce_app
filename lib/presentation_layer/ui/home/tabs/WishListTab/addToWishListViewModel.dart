import 'package:ecommerce/domain_layer/Entities/productResponse/ProductEntity.dart';
import 'package:ecommerce/domain_layer/Use%20case/addToWishListUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/getUserWishList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain_layer/Entities/WishListEntity.dart';
import '../../../../../domain_layer/Entities/addressEntity/AddressEntity.dart';
import '../../../../../domain_layer/Use case/deleteProductUseCase.dart';

@injectable
class AddToWishListViewModel extends Cubit<AddToWishListStates> {
  @factoryMethod
  AddToWishListViewModel(
      {required this.addToWishLstUseCase, required this.getUserWishListUseCase , required this.deleteProductUseCase})
      : super(AddToWishListInitialState());
  AddToWishLstUseCase addToWishLstUseCase;
  GetUserWishListUseCase getUserWishListUseCase;
  DeleteProductUseCase deleteProductUseCase;
  @override
  addToWishList(String productId) async {
    emit(AddToWishListLoadingState());
    try {
      var addressData = await addToWishLstUseCase.invoke(productId: productId);
      addressData.fold((response) {
        emit(AddToWishListSuccessState(wishListEntity: response));
      }, (error) {
        emit(AddToWishListErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(AddToWishListErrorState(errorMessage: e.toString()));
    }
  }

  // getUserWishList() async {
  //   emit(AddToWishListLoadingState());
  //   try {
  //     var addressData = await getUserWishListUseCase.invoke();
  //     addressData.fold((response) {
  //       emit(AddToWishListSuccessState(productEntity: response));
  //     }, (error) {
  //       emit(AddToWishListErrorState(errorMessage: error));
  //     });
  //   } catch (e) {
  //     emit(AddToWishListErrorState(errorMessage: e.toString()));
  //   }
  // }
  // deleteProductUserCase(String productId) async {
  //   emit(AddToWishListLoadingState());
  //   try {
  //     var addressData = await deleteProductUseCase.invoke(productId);
  //     addressData.fold((response) {
  //       emit(AddToWishListSuccessState(productEntity: response));
  //     }, (error) {
  //       emit(AddToWishListErrorState(errorMessage: error));
  //     });
  //   } catch (e) {
  //     emit(AddToWishListErrorState(errorMessage: e.toString()));
  //   }
  // }
}

class AddToWishListStates {}

class AddToWishListInitialState extends AddToWishListStates {}

class AddToWishListLoadingState extends AddToWishListStates {}

class AddToWishListSuccessState extends AddToWishListStates {
  // ProductEntity productEntity;
  WishListEntity wishListEntity;
  AddToWishListSuccessState({required this.wishListEntity});
}

class AddToWishListErrorState extends AddToWishListStates {
  String errorMessage;
  AddToWishListErrorState({required this.errorMessage});
}
