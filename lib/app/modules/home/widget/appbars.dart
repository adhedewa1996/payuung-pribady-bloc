import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';
import 'package:payuung_pribadi_app/app/modules/home/home_controller.dart';

class HomeAppbar extends StatelessWidget implements PreferredSize {
  const HomeAppbar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat Siang',
            style: context.theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          Obx(() {
            return Text(
              '${controller.user.value.personalData?.fullname ?? ''}',
              style: context.theme.textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
            );
          }),
          Spacing.vertical(8),
        ],
      ),
      actions: [
        Stack(
          children: [
            Align(
              child: Icon(
                Icons.notifications_none_rounded,
                size: 35,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '0',
                  style: context.textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Spacing.horizontal(16),
        GestureDetector(
          onTap: () {
            controller.goToProfile();
          },
          child: Container(
            width: 50,
            height: 50,
            // padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(200),
            ),
            child: Obx(() {
              return Center(
                child: Text(
                  '${controller.user.value.personalData?.fullname ?? ''}'.split('').first,
                  style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              );
            }),
          ),
        ),
        Spacing.horizontal(16),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 65);

  @override
  Widget get child => Container();
}
