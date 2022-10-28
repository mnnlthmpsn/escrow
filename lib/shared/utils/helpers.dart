import 'package:flutter/material.dart';

class Helpers {
  static newPage(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  static newPageDestroyPrevious(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }
}

class ScreenSize {
  static getHeight(BuildContext context) {
      return MediaQuery.of(context).size.height;
  }

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}