import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validation = String? Function(String?);

class CustomTextFormField extends StatefulWidget {
  String hintText;
  Validation validator;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  bool visiable;

  CustomTextFormField(
      {required this.hintText,
      required this.validator,
      required this.controller,
      required this.keyboardType , this.obscureText = false , this.visiable = false });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width:368.w,
      child: TextFormField(
        obscureText: widget.obscureText,
        textAlign: TextAlign.start,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        controller: widget.controller,
        style: TextStyle(),
        decoration: InputDecoration(
          suffixIcon: InkWell(onTap: (){
            widget.obscureText=!widget.obscureText;
            setState(() {
            });

          }, child: Visibility(
            visible: widget.visiable,
              child: widget.obscureText == true ?const Icon(Icons.visibility , size: 20, color: Color.fromRGBO(0, 65, 130, 1)):const Icon(Icons.visibility_off , size: 20 , color: Colors.grey,))),
          isDense: true,
          errorStyle: TextStyle(
              fontSize: 15,
              color: Colors.red,
              fontWeight: FontWeight.w800
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            overflow: TextOverflow.ellipsis,
              color: const Color.fromRGBO(0, 0, 0, 0.7),
              fontSize: 18.sp,
              fontWeight: FontWeight.w300),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.r),
          ),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
