import 'package:flutter/material.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/widgets/buttons.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';

void imagePicker({
  required Function() camera,
  required Function() gallery,
  required BuildContext context,
  String? ovverrideTitle,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: false,
    constraints: BoxConstraints(
      maxWidth: context.width(),
    ),
    builder: (context) {
      return Container(
        width: context.width(),
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
