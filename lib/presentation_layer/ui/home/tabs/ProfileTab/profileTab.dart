import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/data_layer/api_manager/apiManager.dart';
import 'package:ecommerce/domain_layer/Entities/addressEntity/Data.dart';
import 'package:ecommerce/presentation_layer/ui/core/local/prefsHelper.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/CategoriesTab/categoryViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProfileTab/addAddressBottomSheet.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProfileTab/addressSelectorBottomSheet.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProfileTab/profileTabViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/CustomTextFieldForUpdate.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/customTextToUpdatePassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../core/local/provider.dart';
import '../../widgets/customButton.dart';
import 'getAddressViewModel.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  Data? selectedData;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController mobileNumController;
  late TextEditingController emailAddressController;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late TextEditingController addressController;
  ProfileTabViewModel viewModel = getIt<ProfileTabViewModel>();
  GetAddressViewModel getAddressViewModel = getIt<GetAddressViewModel>();
  bool updatePasswordWidget = false;

  @override
  void initState() {
    fullNameController = TextEditingController(text: PrefsHelper.getname());
    mobileNumController =
        TextEditingController(text: PrefsHelper.getMobileNum());
    emailAddressController =
        TextEditingController(text: PrefsHelper.getEmail());
    currentPasswordController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();
    newPasswordController = TextEditingController();
    rePasswordController = TextEditingController();
    getAddressViewModel.getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getAddressViewModel,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Welcome, ${PrefsHelper.getname()}",
                  style: const TextStyle(
                      color: Color.fromRGBO(6, 0, 79, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 15,
                      color: Color.fromRGBO(6, 0, 79, 0.6),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      PrefsHelper.getEmail(),
                      style: const TextStyle(
                          color: Color.fromRGBO(6, 0, 79, 0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "Your full name",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 0, 79, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFieldForUpdate(
                  hintText: PrefsHelper.getname(),
                  keyboardType: TextInputType.text,
                  controller: fullNameController,
                  onButtonClicked: () {
                    showAlertDialog("Are you sure to edit your name? ",
                        updateUserNameAndPhone);
                  },
                ),
                const Text(
                  "Your E-mail",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 0, 79, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFieldForUpdate(
                    hintText: PrefsHelper.getEmail(),
                    keyboardType: TextInputType.text,
                    controller: emailAddressController,
                    onButtonClicked: () {
                      Fluttertoast.showToast(
                          msg: "Sorry, you can't edit email now",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.white,
                          textColor: Colors.red,
                          fontSize: 20.0);
                    }
                  //   updateUserEmail();
                  //       // showAlertDialog(
                  //       //     "Are you sure to edit your email? ", updateUserEmail);
                  // },
                ),
                const Text(
                  "Your Password",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 0, 79, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFieldForUpdate(
                  hintText: "",
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  onButtonClicked: () {
                    updatePasswordWidget = !updatePasswordWidget;
                    setState(() {});
                  },
                ),
                Visibility(
                    visible: updatePasswordWidget,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextToUpdatePassword(
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return "Please enter current password";
                                }
                              },
                              hintText: "Enter Current Password:",
                              keyboardType: TextInputType.text,
                              controller: currentPasswordController),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextToUpdatePassword(
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return "Please enter new password";
                                }
                              },
                              hintText: "Enter new Password:",
                              keyboardType: TextInputType.text,
                              controller: newPasswordController),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextToUpdatePassword(
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return "Please renter new password";
                                }
                              },
                              hintText: "Renter  password:",
                              keyboardType: TextInputType.text,
                              controller: rePasswordController),
                          BlocConsumer(
                            bloc: viewModel,
                            builder: (BuildContext context, state) {
                              if (state is ProfileTabLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Color.fromRGBO(0, 65, 130, 1),
                                  ),
                                );
                              }
                              return CustomButton(
                                  buttonText: "Update password",
                                  onButtonClicked: () {
                                    updatePassword();
                                  });
                            },
                            listener: (BuildContext context, Object? state) {
                              if (state is ProfileTabSuccessState) {
                                Fluttertoast.showToast(
                                    msg: "Password edited successfully",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.green,
                                    fontSize: 20.0);
                              } else if (state is ProfileTabErrorState) {
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
                          )
                        ],
                      ),
                    )),
                const Text(
                  "Your mobile number",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 0, 79, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFieldForUpdate(
                  hintText: PrefsHelper.getMobileNum(),
                  keyboardType: TextInputType.text,
                  controller: mobileNumController,
                  onButtonClicked: () {
                    showAlertDialog("Are you sure to edit your mobile number? ",
                        updateUserNameAndPhone);
                  },
                ),
                const Text(
                  "Your Address",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 0, 79, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFieldForUpdate(
                  hintText: selectedData?.details != null && selectedData?.city != null
                      ? '${selectedData!.details}, ${selectedData!.city}'
                      : 'No Address Selected',
                  keyboardType: TextInputType.text,
                  controller: addressController,
                  onButtonClicked: () {
                    showAddressSelectorBottomSheet();
                  },
                  showBottomSheet: () {
                    showAddAddressBottomSheet();
                  },
                  visiable: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateUserNameAndPhone() {
    viewModel.updateUserNameAndPhone(
        name: fullNameController.text, mobileNum: mobileNumController.text);
    PrefsHelper.setUserData(
        emailAddressController.text, fullNameController.text);
    PrefsHelper.setMobileNum(mobileNumController.text);
  }

  void updateUserEmail() {
    viewModel.updateUserEmail(email: emailAddressController.text);
    // PrefsHelper.setUserData(emailAddressController.text, fullNameController.text);
  }

  void updatePassword() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.updateUserPassword(
        current: currentPasswordController.text,
        password: newPasswordController.text,
        rePassword: rePasswordController.text);
    // PrefsHelper.setUserData(emailAddressController.text, fullNameController.text);
  }

  showAlertDialog(String textContent, Function onClicked) {
    showDialog(
      context: context,
      builder: (ctx) =>
          AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              title: Text(
                textContent,
                style: const TextStyle(
                    color: Color.fromRGBO(6, 0, 79, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK',
                      style: TextStyle(
                          color: Color.fromRGBO(6, 0, 79, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  onPressed: () {
                    onClicked();
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Edited Successfully",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.white,
                        textColor: Colors.green,
                        fontSize: 20.0);
                  },
                ),
                TextButton(
                  child: const Text('Cancel',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
    );
  }

  void showAddAddressBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => AddAddressBottomSheet());
  }

  void showAddressSelectorBottomSheet() async{
    dynamic result = await showModalBottomSheet<Data>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => AddressSelectorBottomSheet());
    if (result != null) {
      setState(() {
        selectedData = result;
      });
    }
  }
}
// Expanded(
//   child: BlocBuilder<GetAddressViewModel, GetAddressStates>(
//     bloc: getAddressViewModel,
//     builder: (context, state) {
//       switch (state) {
//         case GetAddressLoadingState():
//           {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         case GetAddressErrorState():
//           {
//             print(state.errorMessage);
//             return Center(
//               child: Text(state.errorMessage,
//                   style: const TextStyle(color: Colors.yellow)),
//             );
//           }
//         case GetAddressSuccessState():
//           {
//             print(state.addressEntity.data?[2].city ?? "No Data");
//             return CustomTextFieldForUpdate(
//               hintText: state.addressEntity.data?[1].city ?? "No Data",
//               keyboardType: TextInputType.text,
//               controller: addressController,
//               onButtonClicked: () {},
//               showBottomSheet: () {
//                 showAddAddressBottomSheet();
//               },
//               visiable: true,
//             );
//           }
//       }
//       return const Text("Empty..",
//           style: TextStyle(color: Colors.yellow));
//     },
//   ),
// ),
// BlocConsumer<ProfileTabViewModel, ProfileTabStates>(
//     bloc: viewModel,
//     builder: (BuildContext context, state) {
//       switch (state) {
//         case ProfileTabLoadingState():
//           {
//             return const Center(
//               child:
//                   CircularProgressIndicator(color: Colors.blue),
//             );
//           }
//         case ProfileTabErrorState():{
//           return Text(state.errorMessage);
//         }
//       }
//       return CustomButton(
//         buttonText: "update",
//         onButtonClicked: () {
//           showAlertDialog("are ", updateUserEmail);
//         },
//       );
//     },
//     listener: (context, state) {
//       switch (state) {
//         case ProfileTabErrorState():
//           {
//             print(state.errorMessage);
//             Fluttertoast.showToast(
//                 msg: state.errorMessage,
//                 toastLength: Toast.LENGTH_LONG,
//                 gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 3,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 20.0);
//           }
//         case ProfileTabSuccessState():
//           {
//             Fluttertoast.showToast(
//                 msg: "Edited Successfully",
//                 toastLength: Toast.LENGTH_LONG,
//                 gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 3,
//                 backgroundColor: Colors.white,
//                 textColor: Colors.green,
//                 fontSize: 20.0);
//           }
//       }
//     }),
