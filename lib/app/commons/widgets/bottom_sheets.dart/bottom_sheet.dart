import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/buttons.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';

void imagePicker({
  required Function() camera,
  required Function() gallery,
  String? ovverrideTitle,
}) {
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: false,
    constraints: BoxConstraints(
      maxWidth: Get.width,
    ),
    builder: (context) {
      return Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton.elevatedButton(
              context: context,
              title: 'Camera',
              callback: () {
                camera.call();
              },
            ),
            Spacing.vertical(12),
            AppButton.elevatedButton(
              context: context,
              title: 'Gallery',
              callback: () {
                gallery.call();
              },
            ),
          ],
        ),
      );
    },
  );
}
