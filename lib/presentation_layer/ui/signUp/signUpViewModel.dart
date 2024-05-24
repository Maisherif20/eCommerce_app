import 'package:ecommerce/domain_layer/Use%20case/authSignupUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpStates> {

  @factoryMethod
  SignUpViewModel({required this.authSignUpUseCase})
      : super(SignUpInitialState());
  AuthSignUpUseCase authSignUpUseCase;
  @override
  void signUp(
      {required String email,
      required String password,
      required String mobileNum,
      required String name}) async {
    emit(SignUpLoadingState());
    try{
      var result = await authSignUpUseCase.invoke(
          email: email, password: password, mobileNum: mobileNum, name: name);
      result.fold((response) {
        emit(SignUpSuccessState(token: response.token!));
      }, (error) {
        emit(SignUpErrorState(errorMessage: error));
      });
    }catch(e)
    {
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }
}

class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  String token;
  SignUpSuccessState({required this.token});
}

class SignUpErrorState extends SignUpStates {
  String errorMessage;
  SignUpErrorState({required this.errorMessage});
}
