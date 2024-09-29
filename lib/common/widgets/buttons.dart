import 'package:flutter/material.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';

class AppButton {
  static Widget common({
    required BuildContext context,
    required Function() callback,
    required IconData icon,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme().buttonTheme.colorScheme!.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        shape: CircleBorder(),
      ),
      onPressed: () {
        callback.call();
      },
      child: Icon(
        icon,
        color: context.theme().primaryIconTheme.color,
      ),
    );
  }

  static Widget elevatedButton({
    required BuildContext context,
    required String title,
    Color? backgroundColor,
    Color? textColor,
    Function()? callback,
  }) {
    return ElevatedButton(
      onPressed: () {
        callback?.call();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.theme().buttonTheme.colorScheme!.primary,
        minimumSize: Size.fromHeight(50),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }

  static Widget outlineButton({
    required BuildContext context,
    required String title,
    Color? backgroundColor,
    Color? textColor,
    Function()? callback,
  }) {
    return OutlinedButton(
      onPressed: () {
        callback?.call();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.theme().buttonTheme.colorScheme!.primary,
        minimumSize: Size.fromHeight(50),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
