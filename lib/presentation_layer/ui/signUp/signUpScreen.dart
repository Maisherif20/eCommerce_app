import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/presentation_layer/ui/core/emailCheck.dart';
import 'package:ecommerce/presentation_layer/ui/core/ex.dart';
import 'package:ecommerce/presentation_layer/ui/core/local/prefsHelper.dart';
import 'package:ecommerce/presentation_layer/ui/core/utils/routesManager.dart';
import 'package:ecommerce/presentation_layer/ui/home/homeScreen.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/customButton.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/customTextFormField.dart';
import 'package:ecommerce/presentation_layer/ui/signIn/signInScreen.dart';
import 'package:ecommerce/presentation_layer/ui/signUp/signUpViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController fullNameController;
  late TextEditingController mobileNumController;
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  bool passwordObscureText = false;
  final _formKey = GlobalKey<FormState>();
  SignUpViewModel viewModel = getIt<SignUpViewModel>();
  @override
  void initState() {
    fullNameController = TextEditingController();
    mobileNumController = TextEditingController();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    mobileNumController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
  }

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
                      height: 40.h,
                    ),
                    Image.asset(
                      "assests/images/signup.png",
                      color: Colors.white,
                      width: 100.w,
                      height: 100.h,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    Text(
                      "Full Name:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your full name",
                      keyboardType: TextInputType.text,
                      controller: fullNameController,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please enter your full name ";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      "Mobile Number:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your mobile number",
                      keyboardType: TextInputType.phone,
                      controller: mobileNumController,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please enter your mobile number ";
                        }
                        if (input.length < 11) {
                          return "Mobile Number must be at laest 11 numbers";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
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
                    const Text(
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
                        if (input.length < 9) {
                          return "Password must at least 9 numbers ";
                        }
                      },
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    BlocConsumer<SignUpViewModel, SignUpStates>(
                      bloc: viewModel,
                      builder: (context, state) {
                        if (state is SignUpLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return CustomButton(
                          buttonText: "Sign up",
                          onButtonClicked: () {
                            signUp();
                          },
                        );
                      },
                      listener: (context, state) {
                        if (state is SignUpErrorState) {
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
                        if (state is SignUpSuccessState) {
                          print(state.token);
                          PrefsHelper.setToken(state.token ??"");
                          PrefsHelper.setMobileNum(mobileNumController.text);
                          Map<String, dynamic> userData={};
                          // PrefsHelper.saveData(emailAddressController.text, mobileNumController.text);
                          Fluttertoast.showToast(
                              msg: "Registered Successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.white,
                              textColor: Colors.green,
                              fontSize: 20.0);
                          SignInScreen().goTo(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                        onTap: () {
                          SignInScreen().goTo(context);
                        },
                        child: Text("Alraedy have account.",
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

  void signUp() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.signUp(
        email: emailAddressController.text,
        password: passwordController.text,
        mobileNum: mobileNumController.text,
        name: fullNameController.text);
  }
}
