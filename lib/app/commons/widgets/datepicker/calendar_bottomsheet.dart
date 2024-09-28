import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/datepicker/datepicker_widget.dart';

class CalendarBottomSheet {
  static Future<String?> show({DatePickerWidget? child}) {
    return Get.bottomSheet<String>(
      SizedBox(
        height: 510,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.maxFinite,
              // height: double.maxFinite,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: child ?? Container(),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
