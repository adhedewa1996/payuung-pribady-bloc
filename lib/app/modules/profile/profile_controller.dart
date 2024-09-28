import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:payuung_pribadi_app/app/commons/models/information_data_model.dart';

class ProfileController extends GetxController {
  final user = InformationDataModel().obs;
  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() {
    final data = Hive.box<InformationDataModel>('PersonalInformationModel').values.toList();
    if (data.isEmpty) {
    } else {
      user.value = data.first;
    }
  }
}
