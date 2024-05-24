import 'package:ecommerce/domain_layer/Entities/addressEntity/AddressEntity.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/Data.dart';
import 'package:ecommerce/domain_layer/Use%20case/addressUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAddressViewModel extends Cubit<AddAddressStates> {
  @factoryMethod
  AddAddressViewModel({required this.addressUseCase})
      : super(AddAddressInitialState());
  AddressUseCase addressUseCase;
  @override
  void addAddress(
      {required String name,
        required String homeDetails,
        required String phone,
        required String city}) async {
    emit(AddAddressLoadingState());
      var result = await addressUseCase.invoke(name: name, homeDetails: homeDetails, phone: phone, city: city);
      return result.fold((response) {
        emit(AddAddressSuccessState(addressEntity: response));
      }, (error) {
        emit(AddAddressErrorState(errorMessage: error));
      });
  }
}
class AddAddressStates {}
class AddAddressInitialState extends AddAddressStates {}
class AddAddressLoadingState extends AddAddressStates {}
class AddAddressSuccessState extends AddAddressStates {
  AddressEntity addressEntity;
  AddAddressSuccessState({required this.addressEntity});
}
class AddAddressErrorState extends AddAddressStates {
  String errorMessage;
  AddAddressErrorState({required this.errorMessage});
}
