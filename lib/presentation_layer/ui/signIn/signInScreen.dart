import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/presentation_layer/ui/core/emailCheck.dart';
import 'package:ecommerce/presentation_layer/ui/core/ex.dart';
import 'package:ecommerce/presentation_layer/ui/core/local/prefsHelper.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/customButton.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/customTextFormField.dart';
import 'package:ecommerce/presentation_layer/ui/signIn/signInViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/signUp/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home/homeScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  SignInViewModel viewModel = getIt<SignInViewModel>();
  @override
  void initState() {
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
  }
  bool passwordObscureText = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 65, 130, 1),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Image.asset(
                      "assests/images/login.png",
                      color: Colors.white,
                      width: 100.w,
                      height: 100.h,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    Text(
                      "Welcome Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "E-mail address:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your email address",
                      keyboardType: TextInputType.emailAddress,
                      controller: emailAddressController,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please enter your email";
                        }
                        bool isVaild =
                            EmailCheck.isEmail(emailAddressController.text);
                        if (isVaild == false) {
                          return "Please enter valid email";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Password:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      visiable: true,
                      obscureText: passwordObscureText,
                      hintText: "Enter your password",
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please enter your password ";
                        }
                      },
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    BlocConsumer(
                      bloc: viewModel,
                      builder: (BuildContext context, state) {
                        if (state is SignInLoadingStates) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return CustomButton(
                            buttonText: "Sign in",
                            onButtonClicked: () {
                              signIn();
                            });
                      },
                      listener: (BuildContext context, Object? state) {
                        if (state is SignInErrorStates) {
                          print(state.errorMessage);
                          Fluttertoast.showToast(
                              msg: state.errorMessage,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20.0);
                        }
                        if (state is SignInSuccessStates) {
                          print(state.authEntity.token);
                          print(state.authEntity.user!.name);
                          PrefsHelper.setUserData(state.authEntity.user!.email ?? "", state.authEntity.user!.name ?? "");
                          PrefsHelper.setToken(state.authEntity.token ??"");
                          print(PrefsHelper.getToken());
                          Fluttertoast.showToast(
                              msg: "Logged in Successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.white,
                              textColor: Colors.green,
                              fontSize: 20.0);
                          HomeScreen().goTo(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                        onTap: () {
                          SignUpScreen().goTo(context);
                        },
                        child: Text("Don't have an account? Create Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.signIn(
        email: emailAddressController.text, password: passwordController.text);
  }
}
