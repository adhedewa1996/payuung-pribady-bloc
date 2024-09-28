import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedMenu = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changePage(int value) {
    selectedMenu.value = value;
    update();
  }
}
