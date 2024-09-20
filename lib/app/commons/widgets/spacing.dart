import 'package:flutter/material.dart';

class Spacing {
  static Widget vertical(double? value) {
    return SizedBox(height: value);
  }

  static Widget horizontal(double? value) {
    return SizedBox(width: value);
  }
}
