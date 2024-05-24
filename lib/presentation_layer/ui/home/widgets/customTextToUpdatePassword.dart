import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef Validation = String? Function(String?);
// typedef OnButtonClicked = void Function();
class CustomTextToUpdatePassword extends StatefulWidget {
  String hintText;
  Validation validator;
  //Validation validator;
  TextEditingController controller;
  TextInputType keyboardType;
  // bool obscureText;
  bool visiable;
  // OnButtonClicked onButtonClicked;
  CustomTextToUpdatePassword(
      {required this.hintText,
        required this.keyboardType,
        required this.controller,
        required this.validator,

        // this.obscureText = false,
        this.visiable = false });

  @override
  State<CustomTextToUpdatePassword> createState() => _CustomTextToUpdatePasswordState();
}

class _CustomTextToUpdatePasswordState extends State<CustomTextToUpdatePassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 368.w,
      child: TextFormField(
        validator: widget.validator,
        style: const TextStyle(color: Color.fromRGBO(6, 0, 79, 1)),
        // initialValue: widget.hintText,
        // onChanged: (value){
        //   widget.hintText = value;
        // },
        // obscureText: widget.obscureText,
        textAlign: TextAlign.start,
        keyboardType: widget.keyboardType,
        //validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
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
