import 'package:ecommerce/domain_layer/Use%20case/authUpdateUserEmailUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/authUpdateUserDataUseCase.dart';
import 'package:ecommerce/domain_layer/Use%20case/updatePasswordUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain_layer/authEntites/AuthEntity.dart';

@injectable
class ProfileTabViewModel extends Cubit<ProfileTabStates> {
  @factoryMethod
  ProfileTabViewModel({required this.updateUserDataUseCase, required this.authUpdateUserEmailUseCase , required this.updatePasswordUseCase })
      : super(ProfileTabInitialState());
  AuthUpdateUserDataUseCase updateUserDataUseCase;
  AuthUpdateUserEmailUseCase authUpdateUserEmailUseCase;
  UpdatePasswordUseCase updatePasswordUseCase;
  //
  void updateUserNameAndPhone(
      {required String name , required String mobileNum}) async {
    emit(ProfileTabLoadingState());
    try{
      var result = await updateUserDataUseCase.invoke(name: name, mobileNum: mobileNum);
      return result.fold((response) {
        emit(ProfileTabSuccessState(authEntity: response));
      }, (error) {
        emit(ProfileTabErrorState(errorMessage: error));
      });
    }catch(e)
    {
      emit(ProfileTabErrorState(errorMessage: e.toString()));
    }
  }
  void updateUserPassword(
      {required String current , required String password ,required String rePassword}) async {
    emit(ProfileTabLoadingState());
    try{
      var result = await updatePasswordUseCase.invoke(current: current, password: password, rePassword: rePassword);
      return result.fold((response) {
        emit(ProfileTabSuccessState(authEntity: response));
      }, (error) {
        emit(ProfileTabErrorState(errorMessage: error));
      });
    }catch(e)
    {
      emit(ProfileTabErrorState(errorMessage: e.toString()));
    }
  }
   updateUserEmail(
      {required String email}) async {
    emit(ProfileTabLoadingState());
    try{
      var result = await authUpdateUserEmailUseCase.invoke(email: email);
      return result.fold((response) {
        emit(ProfileTabSuccessState(authEntity: response));
      }, (error) {
        emit(ProfileTabErrorState(errorMessage: error));
      });
    }catch(e)
    {
      emit(ProfileTabErrorState(errorMessage: e.toString()));
    }
  }
}

class ProfileTabStates {}

class ProfileTabInitialState extends ProfileTabStates {}

class ProfileTabLoadingState extends ProfileTabStates {}

class ProfileTabSuccessState extends ProfileTabStates {
  AuthEntity authEntity;
  ProfileTabSuccessState({required this.authEntity});
}
class ProfileTabErrorState extends ProfileTabStates {
  String errorMessage;
  ProfileTabErrorState({required this.errorMessage});
}
