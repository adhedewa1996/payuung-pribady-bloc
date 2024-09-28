import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/modules/dashboard/bottom_navigtion.dart';
import 'package:payuung_pribadi_app/app/modules/dummy_page/dummy_view.dart';
import 'package:payuung_pribadi_app/app/modules/home/home_view.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Stack(
          children: [
            Obx(() {
              return Scaffold(
                body: [
                  HomeView(),
                  SearchView(),
                  CartView(),
                  TrasactionView(),
                  MyVoucherView(),
                  ShippingAddressView(),
                  FriendlistView(),
                ][controller.selectedMenu.value],
              );
            }),
            BottomNavigation(controller: controller),
          ],
        );
      },
    );
  }
}
