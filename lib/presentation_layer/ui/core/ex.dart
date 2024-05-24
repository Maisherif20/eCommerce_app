import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

extension navigator on Widget {
  void goTo(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return this;
      }));
  void goToWithoutCntext() =>
      Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(builder: (context) {
        return this;
      }));
}
