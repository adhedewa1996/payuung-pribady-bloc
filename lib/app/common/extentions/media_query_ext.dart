import 'package:flutter/material.dart';

extension SizeHelper on BuildContext {
  double sizeHorizontal() {
    return MediaQuery.of(this).size.width;
  }

  double sizeVertical() {
    return MediaQuery.of(this).size.height;
  }
}
