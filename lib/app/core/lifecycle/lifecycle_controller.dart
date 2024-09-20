import 'package:example/app/core/style/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class LifecycleController extends SuperController with WidgetsBindingObserver {
  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  @override
  void didChangePlatformBrightness() {
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    ThemeService().switchFromBrightness(brightness);
    super.didChangePlatformBrightness();
  }
}
