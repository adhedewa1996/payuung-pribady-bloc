import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';
import 'package:payuung_pribadi_app/app/core/config/assets/app_vectors.dart';
import 'package:payuung_pribadi_app/app/core/config/theme/app_colors.dart';
import 'package:payuung_pribadi_app/app/modules/dashboard/dashboard_controller.dart';
import 'package:payuung_pribadi_app/app/modules/home/home_controller.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.controller,
  });

  final DashboardController controller;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final draggableController = DraggableScrollableController();

  final minChildSize = 0.15;
  bool isExpanded = false;

  final menu = <MenuItem>[
    MenuItem(title: 'Beranda', icon: AppVector.banking),
    MenuItem(title: 'Cari', icon: AppVector.banking),
    MenuItem(title: 'Keranjang', icon: AppVector.banking, showNotification: true, notificationCount: 5),
    MenuItem(title: 'Daftar Transaksi', icon: AppVector.banking, showNotification: true, notificationCount: 1),
    MenuItem(title: 'Voucher Saya', icon: AppVector.banking),
    MenuItem(title: 'Alamat Pengiriman', icon: AppVector.banking),
    MenuItem(title: 'Daftar Teman', icon: AppVector.banking),
  ];

  @override
  void initState() {
    draggableController.addListener(() {
      if (draggableController.isAttached) {
        if (draggableController.size < .2) {
          if (isExpanded) {
            isExpanded = false;
            setState(() {});
          }
        } else {
          if (!isExpanded) {
            isExpanded = true;
            setState(() {});
          }
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    draggableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isExpanded)
          GestureDetector(
            onTap: () {
              animatedHide();
            },
            child: Container(
              width: Get.width,
              height: Get.height,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        DraggableScrollableSheet(
          maxChildSize: 0.4,
          minChildSize: 0.155,
          initialChildSize: .155,
          snap: true,
          controller: draggableController,
          builder: (_, draggableController) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color: AppColors.veryLightGrey,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: menu.length,
                          padding: EdgeInsets.only(top: 32),
                          controller: draggableController,
                          physics: ClampingScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1 / .8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final item = menu[index];
                            return _item(item, context, widget.controller.selectedMenu.value == index, index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 2,
                      left: Get.width * .425,
                      right: Get.width * .425,
                      child: Container(
                        width: 50,
                        height: 20,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(5000, 3750),
                            topRight: Radius.elliptical(5000, 3750),
                          ),
                          border: Border(
                            top: BorderSide(
                              width: 1.5,
                              color: AppColors.veryLightGrey,
                            ),
                            right: BorderSide(
                              width: 1.5,
                              color: AppColors.veryLightGrey,
                            ),
                            left: BorderSide(
                              width: 1.5,
                              color: AppColors.veryLightGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: Get.width * .44,
                      right: Get.width * .44,
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            animatedHide();
                          },
                          icon: Icon(
                            isExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _item(
    MenuItem item,
    BuildContext context,
    bool selected,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        widget.controller.changePage(index);
        animatedHide();
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  child: SvgPicture.asset(
                    item.icon,
                    width: 25,
                    height: 25,
                    color: selected ? context.theme.primaryColor : null,
                  ),
                ),
                if (item.showNotification)
                  IgnorePointer(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        margin: EdgeInsets.only(right: 32),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text('${item.notificationCount}', style: context.textTheme.titleSmall?.copyWith(color: Colors.white)),
                      ),
                    ),
                  ),
              ],
            ),
            Spacing.vertical(4),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                color: selected ? context.theme.primaryColor : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void animatedHide() {
    draggableController.animateTo(
      minChildSize,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
    );
  }
}
