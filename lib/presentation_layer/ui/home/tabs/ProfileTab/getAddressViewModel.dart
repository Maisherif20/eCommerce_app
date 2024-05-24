import 'package:ecommerce/domain_layer/Entities/addressEntity/Data.dart';
import 'package:ecommerce/domain_layer/Use%20case/addressUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/getAddressUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain_layer/Entities/addressEntity/AddressEntity.dart';

@injectable
class GetAddressViewModel extends Cubit<GetAddressStates> {

  @factoryMethod
  GetAddressViewModel({required this.getAddressUseCase})
      : super(GetAddressInitialState());
  GetAddressUseCase getAddressUseCase;
  @override
   getAddress() async {
    emit(GetAddressLoadingState());
    try{
      var addressData = await getAddressUseCase.invoke();
      addressData.fold((response) {
        emit(GetAddressSuccessState(addressEntity: response));
      }, (error) {
        emit(GetAddressErrorState(errorMessage: error));
      });
    }catch(e)
    {
      emit(GetAddressErrorState(errorMessage: e.toString()));
    }
  }
}
class GetAddressStates {}
class GetAddressInitialState extends GetAddressStates {}
class GetAddressLoadingState extends GetAddressStates {}
class GetAddressSuccessState extends GetAddressStates {
  AddressEntity addressEntity;
  GetAddressSuccessState({required this.addressEntity});
}
class GetAddressErrorState extends GetAddressStates {
  String errorMessage;
  GetAddressErrorState({required this.errorMessage});
}
