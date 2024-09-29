import 'package:flutter/material.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/widgets/datepicker/datepicker_widget.dart';

class CalendarBottomSheet {
  static void show({
    DatePickerWidget? child,
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: context.height() * .7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.maxFinite,
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
        );
      },
    );
    // return Get.bottomSheet<String>(
    //   SizedBox(
    //     height: 510,
    //     child: Stack(
    //       alignment: Alignment.center,
    //       children: [
    //         Container(
    //           width: double.maxFinite,
    //           // height: double.maxFinite,
    //           padding: const EdgeInsets.all(8),
    //           decoration: const BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.vertical(
    //               top: Radius.circular(16),
    //             ),
    //           ),
    //           child: child ?? Container(),
    //         ),
    //       ],
    //     ),
    //   ),
    //   isScrollControlled: true,
    // );
  }
}
