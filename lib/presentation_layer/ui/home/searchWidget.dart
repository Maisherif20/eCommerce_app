import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50.h,
          width: 380.w,
          child: TextField(
            cursorColor: Color.fromRGBO(0, 65, 130, 1),
            style: GoogleFonts.poppins(
              color: const Color(0xff020202),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(color: Color.fromRGBO(0, 65, 130, 1)),
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(color: Color.fromRGBO(0, 65, 130, 1)),
              ),
              hoverColor: Color.fromRGBO(0, 65, 130, 1),
              focusColor: Color.fromRGBO(0, 65, 130, 1),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                    color: Colors.white,
                    width: 5),
              ),
              hintText: "What do you search for?",
              hintStyle: GoogleFonts.poppins(
                  color: const Color(0xffb2b2b2),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  decorationThickness: 6),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Color.fromRGBO(0, 65, 130, 1),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        // Icon(
        //   Icons.shopping_cart_outlined,
        //   color: Color.fromRGBO(0, 65, 130, 1),
        // )
      ],
    );
  }
}
