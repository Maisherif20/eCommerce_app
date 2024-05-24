import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef Validation = String? Function(String?);
class CustomTextFieldAddAddress extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  Validation validator;
  CustomTextFieldAddAddress({required this.hintText , required this.controller  , required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
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
    );
  }
}
