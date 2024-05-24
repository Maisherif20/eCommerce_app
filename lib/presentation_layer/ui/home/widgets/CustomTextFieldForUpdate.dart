import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../DI/dI.dart';
import '../tabs/ProfileTab/profileTabViewModel.dart';

typedef OnButtonClicked = void Function();
typedef ShowBottomSheet = void Function();

class CustomTextFieldForUpdate extends StatefulWidget {
  String hintText;
  //Validation validator;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  bool visiable;
  OnButtonClicked onButtonClicked;
  ShowBottomSheet? showBottomSheet;
  CustomTextFieldForUpdate(
      {required this.hintText,
      required this.keyboardType,
      required this.controller,
      required this.onButtonClicked,
      this.obscureText = false,
      this.visiable = false , this.showBottomSheet});

  @override
  State<CustomTextFieldForUpdate> createState() =>
      _CustomTextFieldForUpdateState();
}

class _CustomTextFieldForUpdateState extends State<CustomTextFieldForUpdate> {
  ProfileTabViewModel viewModel = getIt<ProfileTabViewModel>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 368.w,
      child: TextFormField(
        style: const TextStyle(color: Color.fromRGBO(6, 0, 79, 1)),
        // initialValue: widget.hintText,
        // onChanged: (value){
        //   widget.hintText = value;
        // },
        obscureText: widget.obscureText,
        textAlign: TextAlign.start,
        keyboardType: widget.keyboardType,
        //validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText:widget.hintText ,
          hintStyle: TextStyle(color: Color.fromRGBO(6, 0, 79, 1)),
          suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
              onTap: (){
                widget.showBottomSheet!();
              },
                child: Visibility(
                  visible: widget.visiable,
                  child: const Icon(Icons.add_home_outlined
                    , color: Color.fromRGBO(6, 0, 79, 1),),
                ),
              ),
              SizedBox(width: 5,),
              InkWell(
                  onTap: () {
                    widget.onButtonClicked();
                    setState(() {});
                  },
                  child: widget.visiable==false?const Icon(
                    Icons.edit,
                    color: Color.fromRGBO(6, 0, 79, 1),
                  ):const Icon(
                    Icons.menu,
                    color: Color.fromRGBO(6, 0, 79, 1),),
              ),
            ],
          ),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(0, 65, 130, 0.3)),
            borderRadius: BorderRadius.circular(15.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(0, 65, 130, 0.3)),
            borderRadius: BorderRadius.circular(15.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(0, 65, 130, 0.3)),
            borderRadius: BorderRadius.circular(15.r),
          ),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
