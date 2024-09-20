import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:example/app/core/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConnection {
  static void init() {
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.none)) {
          if (Get.isSnackbarOpen == false) {
            showSnackbar();
          }
        } else {
          if (Get.isSnackbarOpen == true) Get.back();
        }
      },
    );
  }

  static Future<bool> getstatus() async {
    final check = await Connectivity().checkConnectivity();
    if (check.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }

  static void showSnackbar({
    bool isDismissible = false,
  }) {
    Get.snackbar(
      'Connection',
      'No Internet Connection, Please Turn on Mobile Data Network or Wifi',
      colorText: Colors.white,
      duration: const Duration(days: 1),
      isDismissible: isDismissible,
      backgroundColor: AppColors.redMain,
    );
  }

  static Future<void> checkConnection({
    required Function(bool) onConnect,
  }) async {
    if (await getstatus()) {
      onConnect.call(true);
    } else {
      onConnect.call(false);
    }
  }
}
