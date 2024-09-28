import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payuung_pribadi_app/app/commons/helper/string_extensions.dart';
import 'package:payuung_pribadi_app/app/commons/models/information_data_model.dart';
import 'package:payuung_pribadi_app/app/data/repo/personal_information_database_repo.dart';
import 'package:uuid/uuid.dart';

enum StepData { personalData, personalAddress, companyInformation }

class PersonalInformationController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final step = StepData.personalData.obs;
  final data = InformationDataModel().obs;
  final message = 'Kolom ini wajib diisi';
  final selectedStep = 0.obs;

  // FORM 1
  final personalDataFormKey = GlobalKey<FormState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final gender = ''.obs;
  final education = ''.obs;
  final maritalStatus = ''.obs;

  // FORM 2
  final personalAddressFormKey = GlobalKey<FormState>();
  final TextEditingController nik = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController postalCode = TextEditingController();
  final ktp = ''.obs;
  final province = ''.obs;
  final city = ''.obs;
  final subdistrict = ''.obs;
  final urbanVillage = ''.obs;
  final addressSameAsKTP = false.obs;
  // DOMISILI
  final TextEditingController residenceAddress = TextEditingController();
  final TextEditingController residencePostalCode = TextEditingController();
  final residenceProvince = ''.obs;
  final residenceCity = ''.obs;
  final residenceSubdistrict = ''.obs;
  final residenceUrbanVillage = ''.obs;

  // FORM 3
  final TextEditingController companyName = TextEditingController();
  final TextEditingController companyAddress = TextEditingController();
  final TextEditingController bankBranch = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController accountHolder = TextEditingController();
  final position = ''.obs;
  final lengthOfWork = ''.obs;
  final sourceOfIncome = ''.obs;
  final annualGrossIncome = ''.obs;
  final bankName = ''.obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    setupDummyFromLocal();
    super.onInit();
  }

  void setupPersonalData({
    required InformationDataModel data,
  }) {
    final personal = data.personalData;
    fullname.text = personal?.fullname ?? '';
    dob.text = personal?.dob ?? '';
    email.text = personal?.email ?? '';
    phone.text = personal?.phone ?? '';
    gender.value = personal?.gender ?? '';
    education.value = personal?.education ?? '';
    maritalStatus.value = personal?.maritalStatus ?? '';
  }

  void setupPersonalAddress({
    required InformationDataModel data,
  }) {
    final personal = data.personalAddress;
    nik.text = personal?.nik ?? '';
    ktp.value = personal?.ktp ?? '';
    address.text = personal?.address ?? '';
    province.value = personal?.province ?? '';
    city.value = personal?.city ?? '';
    subdistrict.value = personal?.subdistrict ?? '';
    urbanVillage.value = personal?.urbanVillage ?? '';
    postalCode.text = personal?.postalCode ?? '';
    addressSameAsKTP.value = personal?.addressSameAsKTP ?? false;
    residenceAddress.text = personal?.residenceAddress ?? '';
    residenceProvince.value = personal?.residenceProvince ?? '';
    residenceCity.value = personal?.residenceCity ?? '';
    residenceSubdistrict.value = personal?.residenceSubdistrict ?? '';
    residenceUrbanVillage.value = personal?.residenceUrbanVillage ?? '';
    residencePostalCode.text = personal?.residencePostalCode ?? '';
  }

  void setupCompanyInformation({
    required InformationDataModel data,
  }) {
    final personal = data.companyInformation;
    companyName.text = personal?.name ?? '';
    companyAddress.text = personal?.address ?? '';
    bankBranch.text = personal?.bankBranch ?? '';
    accountNumber.text = personal?.accountNumber ?? '';
    accountHolder.text = personal?.accountHolder ?? '';
    position.value = personal?.position ?? '';
    lengthOfWork.value = personal?.lengthOfWork ?? '';
    sourceOfIncome.value = personal?.sourceOfIncome ?? '';
    annualGrossIncome.value = personal?.annualGrossIncome ?? '';
    bankName.value = personal?.bankName ?? '';
  }

  void setupDummyFromLocal() {
    log('setupDummyFromLocal');
    try {
      final data = Hive.box<InformationDataModel>('PersonalInformationModel').values.toList();
      if (data.isEmpty) {
        log('KOSONG');
      } else {
        inspect(data.first);
        setupPersonalData(data: data.first);
        setupPersonalAddress(data: data.first);
        setupCompanyInformation(data: data.first);
      }
    } catch (e) {
      log('CATCH callFileStorage $e');
      // setupDummyData();
    }
  }

  bool isSelected(StepData value) {
    return step.value == value;
  }

  Future<void> cameraRoll(BuildContext context) async {
    final picker = ImagePicker();
    final media = await picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      await saveImage(image: media.path, context: context);
      Get.close(1);
    } else {
      'CAMERA ROLL, MEDIA IS EMPTY'.snackbar(context);
    }
  }

  Future<void> buildInCamera(BuildContext context) async {
    final picker = ImagePicker();
    final media = await picker.pickImage(source: ImageSource.camera);
    if (media != null) {
      await saveImage(image: media.path, context: context);
      Get.close(1);
    } else {
      'BUILD IN CAMERA, MEDIA IS EMPTY'.snackbar(context);
    }
  }

  void submitPersonalData({
    required BuildContext context,
  }) {
    try {
      final model = PersonalInformationRepo().getAll();
      if (personalDataFormKey.currentState?.validate() ?? false) {
        saveToLocal();
        if (model.isEmpty) {
          PersonalInformationRepo().add(data.value);
        } else {
          PersonalInformationRepo().update(0, data.value);
        }
        tabController.animateTo(1);
        selectedStep.value = 1;
        'Data Biodata berhasil disimpan'.success(context);
      }
    } catch (e) {
      log('CATCH submitPersonalData $e');
    }
  }

  void submitPersonalAddress({
    required BuildContext context,
    bool stay = false,
  }) {
    try {
      final model = PersonalInformationRepo().getAll();

      if (personalAddressFormKey.currentState?.validate() ?? false) {
        saveToLocal();
        if (model.isEmpty) {
          PersonalInformationRepo().add(data.value);
        } else {
          PersonalInformationRepo().update(0, data.value);
        }
        if (!stay) {
          tabController.animateTo(2);
          selectedStep.value = 2;
        }
        'Data Alamat Pribadi berhasil disimpan'.success(context);
      }
    } catch (e) {
      log('CATCH submitPersonalData $e');
    }
  }

  Future<void> submitCompanyInformation(BuildContext context) async {
    try {
      saveToLocal();
      final model = PersonalInformationRepo().getAll();
      if (model.isEmpty) {
        await PersonalInformationRepo().add(data.value);
      } else {
        await PersonalInformationRepo().update(0, data.value);
      }
      'Data Informasi Perusahaan berhasil disimpan'.success(context);
      await Future.delayed(const Duration(milliseconds: 3000), () {
        Get.back();
      });
    } catch (e) {
      log('CATCH submitCompanyInformation $e');
    }
  }

  void move({required int value}) {
    tabController.animateTo(value);
    selectedStep.value = value;
  }

  void saveToLocal() {
    data.value.personalData = PersonalData(
      fullname: fullname.text,
      dob: dob.text,
      email: email.text,
      phone: phone.text,
      gender: gender.value,
      education: education.value,
      maritalStatus: maritalStatus.value,
    );
    data.value.personalAddress = PersonalAddress(
      ktp: ktp.value,
      nik: nik.text,
      address: address.text,
      province: province.value,
      city: city.value,
      subdistrict: subdistrict.value,
      urbanVillage: urbanVillage.value,
      postalCode: postalCode.text,
      addressSameAsKTP: addressSameAsKTP.value,
    );
    data.value.companyInformation = CompanyInformation(
      name: companyName.text,
      address: companyAddress.text,
      position: position.value,
      lengthOfWork: lengthOfWork.value,
      sourceOfIncome: sourceOfIncome.value,
      annualGrossIncome: annualGrossIncome.value,
      bankName: bankName.value,
      bankBranch: bankBranch.text,
      accountNumber: accountNumber.text,
      accountHolder: accountHolder.text,
    );
    inspect(data.value);
  }

  DateTime selectedDate() {
    try {
      if (dob.text != '') {
        return dob.text.toDate();
      } else {
        return DateTime.now();
      }
    } catch (e) {
      return DateTime.now();
    }
  }

  Future<void> getPathWithDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    await PersonalInformationRepo().getFilePath();
  }

  Future<void> saveImage({
    required String image,
    required BuildContext context,
  }) async {
    try {
      final captureImage = File(image).readAsBytesSync();
      final directory = await PersonalInformationRepo().getFilePath();
      final path = '$directory/KTP-${const Uuid().v1()}.png';
      ktp.value = path;
      submitPersonalAddress(context: context, stay: true);
      final imagePath = await File(path).create(recursive: true);
      await imagePath.writeAsBytes(captureImage);
    } catch (e) {
      'CATCH saveImage $e'.snackbar(context);
    }
  }
}
