import 'package:flutter/material.dart';
import 'package:payuung_pribadi_app/common/widgets/page_transition.dart/page_transition.dart';
import 'package:payuung_pribadi_app/common/widgets/page_transition.dart/page_transition_type.dart';

Duration duration() => Duration(milliseconds: 500);

extension NavigationHelper on Widget {
  void push(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.centerLeft,
        child: this,
        // childCurrent: this,
        duration: duration(),
      ),
    );
  }

  void pushReplacement(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.centerLeft,
        child: this,
        // childCurrent: this,
        duration: duration(),
      ),
    );
  }

  void pushAndRemoveUntil(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.centerLeft,
        child: this,
        // childCurrent: this,
        duration: duration(),
      ),
      (route) => false,
    );
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
