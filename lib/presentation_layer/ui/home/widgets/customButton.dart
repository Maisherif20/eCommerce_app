import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef OnButtonClicked = void Function();
class CustomButton extends StatelessWidget {
  String buttonText;
  OnButtonClicked onButtonClicked;
  CustomButton({required this.buttonText , required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10)
      ),
        onPressed: (){
          print("Done");
          onButtonClicked();
        },
        child: Text(
          buttonText,
          style: TextStyle(color: Color.fromRGBO(0, 65, 130, 1) , fontSize: 20 , fontWeight: FontWeight.w600),
        ));
  }
}
