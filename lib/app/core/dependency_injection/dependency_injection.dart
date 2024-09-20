import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependencyInjection {
  DependencyInjection._();

  static Future<void> init() async {
    // FOR EXAMPLE INJECT GET STORAGE ONLY WHEN NEEDED
    Get.lazyPut<GetStorage>(() => GetStorage());
    // Get.lazyPut<FirebaseCrashlytics>(() => FirebaseCrashlytics.instance);
  }
}
