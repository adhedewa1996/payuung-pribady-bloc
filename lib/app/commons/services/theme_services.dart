import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:payuung_pribadi_app/app/commons/constants.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isThemeMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  Future<void> _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  Future<void> initTheme() async {
    await Future.delayed(const Duration(milliseconds: 250));

    if (AppContants.variantRed.contains(FlutterConfig.get('APP_SUFFIX_ID'))) {
      Get.changeThemeMode(ThemeMode.dark);
      await _saveThemeToBox(true);
    } else {
      Get.changeThemeMode(ThemeMode.light);
      await _saveThemeToBox(false);
    }
  }

  void switchTheme() {
    // Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    // _saveThemeToBox(!_loadThemeFromBox());
  }

  void switchFromBrightness(Brightness brightness) {
    // if (variantRedTheme.contains(FlutterConfig.get('APP_SUFFIX_ID'))) {}
    // if (brightness == Brightness.dark) {
    //   Get.changeThemeMode(ThemeMode.dark);
    //   _saveThemeToBox(true);
    // } else {
    //   Get.changeThemeMode(ThemeMode.light);
    //   _saveThemeToBox(false);
    // }
  }
}
