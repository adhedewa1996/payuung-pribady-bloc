import 'package:flutter/material.dart';

extension ContextHelper on BuildContext {
  double width() => MediaQuery.of(this).size.width;

  double height() => MediaQuery.of(this).size.height;

  ThemeData theme() => Theme.of(this);
}
