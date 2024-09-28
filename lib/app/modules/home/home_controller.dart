import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:payuung_pribadi_app/app/commons/helper/dummy_helper.dart';
import 'package:payuung_pribadi_app/app/commons/models/information_data_model.dart';
import 'package:payuung_pribadi_app/app/commons/models/wellness_model.dart';
import 'package:payuung_pribadi_app/app/core/config/assets/app_vectors.dart';
import 'package:payuung_pribadi_app/app/core/lifecycle/lifecycle_controller.dart';
import 'package:payuung_pribadi_app/app/data/repo/personal_information_database_repo.dart';
import 'package:payuung_pribadi_app/app/data/repo/wellness_database.dart';
import 'package:payuung_pribadi_app/app/routes/app_pages.dart';

class HomeController extends LifecycleController with GetSingleTickerProviderStateMixin {
  final user = InformationDataModel().obs;
  final selectedBottomMenu = 1.obs;

  final financialProducts = <MenuItem>[
    MenuItem(title: 'Urun', isNew: true, icon: AppVector.banking),
    MenuItem(title: 'Pembiayaan \nPorsi haji', icon: AppVector.coin),
    MenuItem(title: 'Financial \nCheck Up', icon: AppVector.creditCard),
    MenuItem(title: 'Asuransi \nMobil', icon: AppVector.money),
    MenuItem(title: 'Asuransi \nProperti', icon: AppVector.monitor),
  ];

  final selectedCategory = <MenuItem>[
    MenuItem(title: 'Hobi', icon: AppVector.banking),
    MenuItem(title: 'Merchandise', icon: AppVector.coin),
    MenuItem(title: 'Gaya Hidup \nSehat', icon: AppVector.creditCard),
    MenuItem(title: 'Konseling & \nRohani', icon: AppVector.monitor),
    MenuItem(title: 'Self \nDevelopment', icon: AppVector.onlineShop),
    MenuItem(title: 'Perencanaan \nKeuangan', icon: AppVector.banking),
    MenuItem(title: 'Konsultasi \nMedis', icon: AppVector.money),
    MenuItem(title: 'Lihat Semua', icon: AppVector.creditCard),
  ];

  final wellnewss = <WellnewssItem>[].obs;

  late TabController tabcontroller;
  final selectedWellnessFilter = 'Terpopuler'.obs;
  final wellnewssFilter = ['Terpopuler', 'A to Z', 'Z to A', 'Harga Terendah', 'Harga Tertinggi'];

  @override
  void onInit() {
    tabcontroller = TabController(length: 2, vsync: this);
    Future.delayed(const Duration(seconds: 1), () {});
    fetchUser();
    fetchWellnewss();
    super.onInit();
  }

  void fetchUser() {
    final dummyUser = InformationDataModel(
      personalData: PersonalData(
        fullname: DummyHelper.fullname,
        email: DummyHelper.email,
        dob: DummyHelper.dob,
        phone: DummyHelper.phone,
        gender: DummyHelper.gender,
      ),
    );
    final data = Hive.box<InformationDataModel>('PersonalInformationModel').values.toList();
    if (data.isEmpty) {
      PersonalInformationRepo().add(dummyUser);
      user.value = dummyUser;
    } else {
      user.value = data.first;
    }
  }

  void fetchWellnewss() {
    try {
      final data = Hive.box<WellnewssItem>('WellnewssItem').values.toList();
      if (data.isEmpty) {
        // IF EMPTY SAVE DUMMY TO DATABASE LOCAL
        for (final item in DummyHelper.exploreWellness) {
          WellnessRepo().add(item);
          wellnewss.add(item);
        }
      } else {
        for (final item in DummyHelper.exploreWellness) {
          wellnewss.add(item);
        }
      }
    } catch (e) {
      log('fetchWellnewss Catch $e');
    }
  }

  Future<void> goToProfile() async {
    await Get.toNamed(Routes.PROFILE)?.then((value) {
      fetchUser();
    });
  }
}

class MenuItem {
  MenuItem({
    required this.title,
    required this.icon,
    this.isNew = false,
    this.showNotification = false,
    this.notificationCount = 0,
  });
  final String title;
  final String icon;
  final bool isNew;
  final bool showNotification;
  final int notificationCount;
}
