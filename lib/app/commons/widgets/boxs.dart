import 'package:example/app/commons/models/news_models.dart';
import 'package:example/app/commons/widgets/spacing.dart';
import 'package:example/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin Boxs {
  static Widget withThemeColors({
    required BuildContext context,
    required String text,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SOMETHING);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.all(20),
        width: Get.width,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: context.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }

  static Widget withPalletColors({
    required Color colors,
    required String text,
    required String description,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SOMETHING);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.all(20),
        width: Get.width,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              text,
              style: context.theme.textTheme.titleLarge,
            ),
            Spacing.vertical(16),
            Text(
              description,
              style: context.theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }

  static Widget news({
    required DatumDatum news,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SOMETHING);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.all(20),
        width: Get.width,
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title ?? '',
              style: context.theme.textTheme.titleLarge,
            ),
            Spacing.vertical(16),
            Text(
              news.summary ?? '',
              style: context.theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
