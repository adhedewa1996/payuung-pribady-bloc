import 'dart:developer';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionServices {
  static Future<void> storagePermission() async {
    if (Platform.isAndroid) {
      await Permission.manageExternalStorage.request().whenComplete(() async {
        if (await Permission.manageExternalStorage.isGranted) {
          log('GRANTED');
        } else {
          log('CANCELED');
        }
      });
    } else {
      await Permission.storage.request().whenComplete(() async {
        if (await Permission.storage.isGranted) {
          log('GRANTED');
        } else {
          log('CANCELED');
        }
      });
    }
  }
}
