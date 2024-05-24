import 'package:flutter/material.dart';
class MyData extends ChangeNotifier {
  String _value = 'Initial Value';
  String get value => _value;
  void updateValue(String newValue) {
    _value = newValue;
    notifyListeners();
  }
}