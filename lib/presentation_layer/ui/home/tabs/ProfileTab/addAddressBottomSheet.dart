import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProfileTab/addAddressViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/customTextFieldAddAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAddressBottomSheet extends StatefulWidget {
  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}
class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController homeDetailsController;
  late TextEditingController phoneController;
  late TextEditingController cityController;
  AddAddressViewModel viewModel = getIt<AddAddressViewModel>();
  @override
  void initState() {
    fullNameController = TextEditingController();
    homeDetailsController = TextEditingController();
    phoneController = TextEditingController();
    cityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    homeDetailsController.dispose();
    phoneController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextFieldAddAddress(
                  validator: (input){
                    if(input == null || input.isEmpty)
                      {
                        return "please enter your name";
                      }
                    return null;
                  },
                    hintText: "Enter your name:", controller: fullNameController),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFieldAddAddress(
                    validator: (input){
                      if(input ==null || input.isEmpty)
                      {
                        return "please enter your home details";
                      }
                      return null;
                    },
                    hintText: "Enter your home details:",
                    controller: homeDetailsController),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFieldAddAddress(
                    validator: (input){
                      if(input ==null || input.isEmpty)
                      {
                        return "please enter your phone";
                      }else if(input.length >11){

                        return "Mobile number must contain 11 numbers";
                      }
                      return null;
                    },
                    hintText: "Enter your phone:", controller: phoneController),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFieldAddAddress(
                    validator: (input)
                    {
                      if(input ==null || input.isEmpty)
                      {
                        return "please enter your city";
                      }
                      return null;
                    },
                    hintText: "Enter your city:", controller: cityController),
                SizedBox(
                  height: 10.h,
                ),
                BlocConsumer(
                  bloc: viewModel,
                  builder: (BuildContext context, state) {
                    if (state is AddAddressLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(0, 65, 130, 1),
                        ),
                      );
                    }
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(0, 65, 130, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        onPressed: () {
                          addAddress();
                        },
                        child: const Text(
                          "Add address",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ));
                  },
                  listener: (BuildContext context, Object? state) {
                    if (state is AddAddressSuccessState) {
                      Fluttertoast.showToast(
                          msg: state.addressEntity.message ??"",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.white,
                          textColor: Colors.green,
                          fontSize: 20.0);
                      Navigator.pop(context);
                    }
                    else if (state is AddAddressErrorState) {
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  void addAddress(){
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.addAddress(name: fullNameController.text, homeDetails: homeDetailsController.text,
        phone: phoneController.text, city: cityController.text);
  }
}
