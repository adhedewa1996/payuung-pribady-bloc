import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class PermissionServices {
  static Future<void> storagePermission() async {
    await Permission.manageExternalStorage.request().whenComplete(() async {
      if (await Permission.manageExternalStorage.isGranted) {
        log('GRANTED');
      } else {
        log('CANCELED');
      }
    });
  }
}
