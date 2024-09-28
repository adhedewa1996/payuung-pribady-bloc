import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';

extension StringHelper on String {
  void snackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(this),
      ),
    );
  }

  DateTime toDate() {
    final format = DateFormat('dd MMMM yyyy');
    return format.parse(this);
  }

  void success(BuildContext context) {
    Get.rawSnackbar(
      title: 't',
      message: 'm',
      titleText: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            Spacing.horizontal(16),
            Text(
              this,
              style: context.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      messageText: SizedBox(
        width: 0,
        height: 0,
      ),
      snackPosition: SnackPosition.TOP,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      borderRadius: 8,
      backgroundColor: Colors.green,
      duration: Duration(milliseconds: 1500),
    );
  }
}

extension StringNullHelper on String? {
  bool valid() {
    return this != '' && this != null;
  }
}
