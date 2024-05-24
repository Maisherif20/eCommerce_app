import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain_layer/authEntites/AuthEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain_layer/Use case/authSignInUseCase.dart';

@injectable
class SignInViewModel extends Cubit<SignInStates> {
  AuthSignInUseCase authSignInUseCase;
  @factoryMethod
  SignInViewModel({required this.authSignInUseCase})
      : super(SignInIntialStates());
  void signIn({required String email, required String password}) async {
    emit(SignInLoadingStates());
    var result =
        await authSignInUseCase.invoke(email: email, password: password);
    return result.fold((response) {
      emit(SignInSuccessStates(authEntity: response));
    }, (error) {
      emit(SignInErrorStates(errorMessage: error));
    });
  }
}

class SignInStates {}

class SignInIntialStates extends SignInStates {}

class SignInLoadingStates extends SignInStates {}

class SignInErrorStates extends SignInStates {
  String errorMessage;
  SignInErrorStates({required this.errorMessage});
}

class SignInSuccessStates extends SignInStates {
  AuthEntity authEntity;
  SignInSuccessStates({required this.authEntity});
}
