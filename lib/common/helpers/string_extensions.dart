import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';

extension StringHelper on String {
  void snackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.green,
        margin: EdgeInsets.only(bottom: context.height() * .85, right: 20, left: 20),
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.green,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              Spacing.horizontal(16),
              Text(this),
            ],
          ),
        ),
      ),
    );
  }

  DateTime toDate() {
    final format = DateFormat('dd MMMM yyyy');
    return format.parse(this);
  }
}

extension StringNullHelper on String? {
  bool valid() {
    return this != '' && this != null;
  }
}
