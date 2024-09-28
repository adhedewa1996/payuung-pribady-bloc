import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';
import 'package:payuung_pribadi_app/app/core/config/theme/app_colors.dart';
import 'package:payuung_pribadi_app/app/routes/app_pages.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: context.textTheme.titleLarge,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.veryLightGrey,
      ),
      body: ColoredBox(
        color: AppColors.veryLightGrey,
        child: ListView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          children: [
            _profileItem(context),
            Spacing.vertical(32),
            _item(
              title: 'Informasi Pribadi',
              callback: () async {
                await Get.toNamed(Routes.PERSONAL_INFORMATION)?.then((value) {
                  controller.onInit();
                });
              },
            ),
            _item(title: 'Syarat & Ketentuan'),
            _item(title: 'Bantuan'),
            _item(title: 'Kebijakan Privasi'),
            _item(title: 'Log Out'),
            _item(title: 'Hapus Akun'),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Obx(() {
                return Center(
                  child: Text(
                    '${controller.user.value.personalData?.fullname ?? ''}'.split('').first,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 42,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.veryLightGrey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        Spacing.horizontal(16),
        Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${controller.user.value.personalData?.fullname ?? ''}', style: context.textTheme.titleLarge),
              Text('Masuk dengan google', style: context.textTheme.titleMedium),
            ],
          );
        }),
      ],
    );
  }

  Widget _item({
    required String title,
    Function()? callback,
  }) {
    return GestureDetector(
      onTap: () {
        callback?.call();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.veryLightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.verified_user_outlined,
                size: 30,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
