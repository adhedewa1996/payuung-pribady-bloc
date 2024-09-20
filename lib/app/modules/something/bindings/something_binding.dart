import 'package:get/get.dart';

import '../controllers/something_controller.dart';

class SomethingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SomethingController>(
      () => SomethingController(),
    );
  }
}
