import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

extension MathString on String {
  String firstLine() {
    final ls = LineSplitter();
    final list = ls.convert(this);
    return list.first.removeRightSide().replaceAll(' ', '').replaceAll('x', '*').replaceAll(':', '/').replaceAll('÷', '/');
  }

  String removeRightSide() {
    if (contains('=')) {
      final split = this.split('=');
      return split.first;
    }
    return this;
  }

  String calculatedValue() {
    final p = Parser();
    final exp = p.parse(this);
    final result = exp.simplify();
    return '${result.evaluate(EvaluationType.REAL, ContextModel())}';
  }

  void snackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(this),
      ),
    );
  }
}
