import 'package:flutter/material.dart';

class AddressReview extends StatelessWidget {
  String homeDeatils;
  String city;
  AddressReview({required this.homeDeatils , required this.city});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Text("Home Details: $homeDeatils" , overflow: TextOverflow.ellipsis , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 14),),
         Text("City: $city" , overflow: TextOverflow.ellipsis , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 14),),
      ],
    );
  }
}
